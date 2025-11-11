# 🧭 Cyberlete Sales Nav LinkedIn Reactions Dataset

**File name:** `cyberlete_sales_nav_list_linkedin_reactions_result (4)`  
**Source:** Sales Navigator + LinkedIn Reaction Scraper  
**Owner:** Cyberlete Research Project  
**Verified:** ✅ November 10, 2025  
**Uploaded by:** Barry Keane  

---

## 📂 File Access

- **Google Drive Viewer:**  
  🔗 [https://drive.google.com/file/d/1gYpxGjBAZCiJauXjnDg1p8RIvNUSs9DiwrFWFEEH05I/view](https://drive.google.com/file/d/1gYpxGjBAZCiJauXjnDg1p8RIvNUSs9DiwrFWFEEH05I/view)

- **Direct CSV Export (machine-readable):**  
  💾 [https://docs.google.com/spreadsheets/d/1gYpxGjBAZCiJauXjnDg1p8RIvNUSs9DiwrFWFEEH05I/export?format=csv](https://docs.google.com/spreadsheets/d/1gYpxGjBAZCiJauXjnDg1p8RIvNUSs9DiwrFWFEEH05I/export?format=csv)

---

## 🧩 Dataset Overview

| Attribute | Description |
|------------|--------------|
| **Rows** | 5,088 |
| **Columns** | 20 |
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
- ⚙️ 7,414 uneven-quote lines were verified to be legitimate multiline text entries in `postContent`  
- ⚠️ Some optional columns (e.g., `videoUrl`, `sharedJobUrl`) contain expected nulls  
- 🔤 File encoded in **UTF-8**; line breaks sanitized for compatibility  
- 🧮 Validation executed using pandas (`quoting=1`, `on_bad_lines='warn'`)

---

## 🧠 Usage Recommendations
- Use the **CSV export link** for ingestion by Claude, Perplexity, or NotebookLM.  
- Keep this manifest as the lightweight reference file within Claude’s project to preserve full context without storage overhead.  
- If performing data transformations or prompt-based queries, limit sample size to 5k rows for best efficiency.

---

**Maintained by:**  
Cyberlete Team  
Last updated: November 10, 2025