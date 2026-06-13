-- =====================================================
-- SEO PERFORMANCE ANALYSIS - SQL QUERIES
-- Author: Patrick Adu Osei
-- Project: SEO Performance Analysis (Organic Traffic Insights)
-- =====================================================

-- Dataset: synthetic_seo_performance_dataset.csv
-- Tool: SQLite (DB Browser)
-- Purpose: SEO performance analysis

-- =====================================================
-- 1. TOP PERFORMING PAGES BY ORGANIC CLICKS
-- Purpose: Identify pages driving the most traffic
-- =====================================================

SELECT 
    page,
    SUM(clicks) AS total_clicks
FROM seo_data
GROUP BY page
ORDER BY total_clicks DESC;

-- =====================================================
-- 2. HIGH-IMPRESSION KEYWORDS WITH LOW CTR
-- Purpose: Identify SEO optimisation opportunities
-- (Keywords appearing often but not generating clicks)
-- =====================================================

SELECT 
    keyword,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    ROUND(SUM(clicks) * 1.0 / SUM(impressions), 4) AS ctr
FROM seo_data
GROUP BY keyword
HAVING total_impressions > 2000
   AND ctr < 0.03
ORDER BY total_impressions DESC;

-- =====================================================
-- 3. ORGANIC TRAFFIC TRENDS OVER TIME
-- Purpose: Analyse performance trends and seasonality
-- =====================================================

SELECT 
    date,
    SUM(clicks) AS total_clicks,
    SUM(impressions) AS total_impressions
FROM seo_data
GROUP BY date
ORDER BY date ASC;

-- =====================================================
-- 4. TOTAL ORGANIC CLICKS OVER TIME (SHORT-TERM VIEW)
-- Purpose: Highlight daily engagement trends
-- =====================================================

SELECT 
    date,
    SUM(clicks) AS total_clicks
FROM seo_data
GROUP BY date
ORDER BY date DESC
LIMIT 30;

-- =====================================================
-- 5. CTR VS AVERAGE SEARCH POSITION
-- Purpose: Understand impact of ranking on CTR
-- =====================================================

SELECT 
    ROUND(avg_position, 0) AS position_group,
    ROUND(AVG(ctr), 4) AS avg_ctr
FROM seo_data
GROUP BY position_group
ORDER BY position_group ASC;

-- =====================================================
-- 6. ORGANIC TRAFFIC PERFORMANCE BY DEVICE
-- Purpose: Compare user behaviour across devices
-- =====================================================

SELECT 
    device,
    SUM(clicks) AS total_clicks,
    SUM(impressions) AS total_impressions,
    ROUND(SUM(clicks) * 1.0 / SUM(impressions), 4) AS ctr
FROM seo_data
GROUP BY device
ORDER BY total_clicks DESC;

-- =====================================================
-- 7. ORGANIC TRAFFIC PERFORMANCE BY COUNTRY
-- Purpose: Identify regional performance differences
-- =====================================================

SELECT 
    country,
    SUM(clicks) AS total_clicks,
    SUM(impressions) AS total_impressions,
    ROUND(SUM(clicks) * 1.0 / SUM(impressions), 4) AS ctr
FROM seo_data
GROUP BY country
ORDER BY total_clicks DESC;

-- =====================================================
-- OPTIONAL BONUS QUERY
-- 8. TOP KEYWORDS BY CLICKS
-- Purpose: Identify best-performing keywords
-- =====================================================

SELECT 
    keyword,
    SUM(clicks) AS total_clicks
FROM seo_data
GROUP BY keyword
ORDER BY total_clicks DESC;
