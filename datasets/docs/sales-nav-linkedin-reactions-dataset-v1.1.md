---
title: Cyberlete Sales Nav LinkedIn Reactions Dataset
date: 2025-11-10
version: 1.1
author: Barry Keane
project: Cyberlete
tags: [dataset, linkedin, reactions, salesnav, cyberlete]
---

# 🧭 Cyberlete Sales Nav LinkedIn Reactions Dataset

**File name:** `cyberlete_sales_nav_list_linkedin_reactions_result (4)`  
**Source:** Sales Navigator + LinkedIn Reaction Scraper  
**Owner:** Cyberlete Research Project  
**Verified:** ✅ November 10, 2025  
**Uploaded by:** Barry Keane  

---

## 🔗 Data Access Summary
| Type | Link |
|------|------|
| View online | [Drive Viewer](https://drive.google.com/file/d/1gYpxGjBAZCiJauXjnDg1p8RIvNUSs9DiwrFWFEEH05I/view) |
| Download CSV | [Direct Export](https://docs.google.com/spreadsheets/d/1gYpxGjBAZCiJauXjnDg1p8RIvNUSs9DiwrFWFEEH05I/export?format=csv) |

---

## 🧩 Dataset Overview

| Attribute | Description |
|------------|--------------|
| **Rows** | 5,088 |
| **Columns** | 20 |
| **File Size (CSV)** | ~9.8 MB |
| **Period Covered** | July – October 2025 |
| **Data Origin** | Cyberlete LinkedIn engagement scraping pipeline |
| **Purpose** | Identify engagement clusters, influencer overlap, and sentiment patterns around Cyberlete tournament and product updates |

---

## 🧱 Schema Summary

| Column | Description |
|:--------|:-------------|
| `postUrl` | Link to the LinkedIn post |
| `imgUrl` | Image thumbnail (if applicable) |
| `postContent` | Full text content of post (cleaned, UTF-8, multiline sanitized) |
| `type` | Post type (video, article, repost, etc.) |
| `likeCount` | Number of likes |
| `commentCount` | Number of comments |
| `repostCount` | Number of reposts |
| `postDate` | Date post was published |
| `action` | Engagement action captured (e.g., like, comment, share) |
| `author` | Author display name |
| ... | 10 additional fields (e.g., authorUrl, timestamp, sharedPostUrl, videoUrl, etc.) |

---

## 🧾 Data Integrity Notes
- ✅ Parsed successfully with 5,088 valid rows and 20 columns  
- ⚙️ 7,414 uneven-quote lines were verified as legitimate multiline text entries in `postContent`  
- ⚠️ Optional fields (e.g., `videoUrl`, `sharedJobUrl`) contain expected nulls  
- 🔤 File encoded UTF-8; line breaks sanitized for compatibility  
- 🧮 Validation executed using pandas (`quoting=1`, `on_bad_lines='warn'`)

---

## 🧠 Usage Recommendations
- Use the **CSV export link** for ingestion by Claude, Perplexity, or NotebookLM.  
- Keep this manifest as the lightweight reference file within Claude’s project to preserve full context without storage overhead.  
- When running data transformations or prompts, limit sample size to ~5 k rows for efficiency.

---

**Maintained by:**  
Cyberlete Team  
_Last updated: November 10 2025_