# 👩🏻‍⚕️ Product Analytics Mini Case Study

## 📌 Solution

### 1. How many unique users exist in the logs dataset?

```sql
SELECT
  COUNT(DISTINCT id) AS unique_users
FROM health.user_logs
```
