---
title: Cyberlete Column Glossary
date: 2025-11-10
version: 1.0
author: Barry Keane
project: Cyberlete
tags: [dataset, schema, linkedin, reactions, cyberlete]
---

# 🗂️ Cyberlete Column Glossary

**Dataset Reference:** `cyberlete_sales_nav_list_linkedin_reactions_result (4)`  
**Rows:** 5,088  
**Columns:** 20  
**Verified:** November 10 2025  

---

## 🧩 Column Reference Table

| Column Name | Data Type | Description | Example / Notes |
|--------------|------------|--------------|------------------|
| **postUrl** | string (URL) | Full LinkedIn post URL. Unique identifier for each record. | `https://www.linkedin.com/posts/...` |
| **imgUrl** | string (URL / null) | Image link associated with the post. Often blank for text-only updates. | Optional field. |
| **postContent** | text (UTF-8, multiline) | The text body of the post including mentions, emojis, and hashtags. | Sanitized: line breaks replaced with spaces. |
| **type** | categorical | Post type (article, image, video, share, text). | Parsed from LinkedIn metadata. |
| **likeCount** | integer | Number of likes registered for the post at scrape time. | e.g. `127` |
| **commentCount** | integer | Number of comments. | e.g. `32` |
| **repostCount** | integer | Number of reposts or shares. | e.g. `5` |
| **postDate** | date (YYYY-MM-DD) | Original publish date of the post. | e.g. `2025-09-14` |
| **action** | categorical | Engagement action type captured by the scraper (`like`, `comment`, `share`, `view`). | May be repeated per user engagement. |
| **author** | string | Display name of the post author. | e.g. `Geoffrey — Cyberlete CEO` |
| **authorUrl** | string (URL / null) | LinkedIn profile URL of the author. | e.g. `https://linkedin.com/in/geoffrey...` |
| **profileUrl** | string (URL / null) | Profile URL of the person who engaged (if different from author). | Used in influencer mapping. |
| **timestamp** | datetime | Timestamp of data capture or engagement event. | ISO 8601 format. |
| **viewCount** | integer / null | Post impressions (if available). | Often missing — LinkedIn hides exact views for some posts. |
| **postTimestamp** | datetime | Internal system timestamp of post publication. | Cross-check with `postDate`. |
| **sharedPostUrl** | string (URL / null) | Original post URL when this post is a reshared update. | Useful for chain mapping. |
| **videoUrl** | string (URL / null) | Link to embedded video media. | Optional; ~10% population. |
| **commentContent** | text / null | The text of a comment associated with the post. | Used in sentiment analysis. |
| **commentUrl** | string (URL / null) | Direct URL of comment thread. | Optional. |
| **sharedJobUrl** | string (URL / null) | Job link when the post is a job share. | Typically null for Cyberlete dataset. |

---

## 🧮 Data Notes

- **Encoding:** UTF-8  
- **Newlines:** Replaced with single space (`\n` → ` `) to reduce row count inflation.  
- **Missing Values:** `NaN` / `null` retained for integrity.  
- **Quoted Fields:** All text columns wrapped in `"` to preserve embedded commas.  
- **Primary Key:** `postUrl` (unique per post).  

---

## 🧠 Analysis Use-Cases per Column

| Analytical Lens | Relevant Columns | Example Query |
|------------------|------------------|----------------|
| **Engagement Analysis** | `likeCount`, `commentCount`, `repostCount` | “Which post types generated the highest total engagement?” |
| **Sentiment / Text Mining** | `postContent`, `commentContent` | “Classify tone of posts with ≥100 likes.” |
| **Influencer Mapping** | `author`, `authorUrl`, `profileUrl`, `action` | “Identify recurring reactors engaging with Cyberlete content.” |
| **Temporal Analysis** | `postDate`, `postTimestamp`, `timestamp` | “Visualize engagement growth over time.” |
| **Content Type Trends** | `type`, `videoUrl`, `imgUrl`, `sharedPostUrl` | “Compare engagement across post types (text vs. video vs. article).” |

---

## 🧾 Data Validation Summary (from pandas inspection)

| Metric | Value | Notes |
|--------|--------|-------|
| Rows parsed | 5,088 | Matches Sheets import |
| Columns parsed | 20 | As expected |
| Potential malformed lines | 7,414 | Line breaks inside quoted postContent |
| Columns with nulls | 14 / 20 | Expected for optional fields |
| Encoding | UTF-8 | Verified |

---

## 📈 Recommendations for AI Analysis
- Use `postContent` and `commentContent` for text embedding or clustering.  
- Use `postUrl` as a unique anchor for visualizations or backlinks.  
- Limit working sample size to ≤5,000 rows for Claude efficiency.  
- Retain `likeCount` + `commentCount` as composite metric (`totalEngagement`).  
- For network analysis, pivot on `author` → `profileUrl` connections.

---

**Maintained by:** Cyberlete Team  
**Version:** 1.0  |  **Date:** November 10 2025