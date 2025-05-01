Here’s a clean and professional **README.md** content you can use for your project:

---

# 🚀 JobRocket

**JobRocket** is a Ruby on Rails web app that helps you search and download the latest job postings scraped using the SerpAPI Google Jobs API.

With a beautiful and mobile-friendly UI, you can search by job title, location, remote preference, language, number of jobs, and date range — and download the results as a `.txt` file.

---

## ✨ Features

✅ Search jobs by title, location, and date  
✅ Remote or on-site filtering  
✅ Supports English + other languages  
✅ Choose how many jobs to fetch (max 100)  
✅ Download results as `.txt`  
✅ Mobile-friendly + desktop-friendly design  
✅ Dark mode toggle (optional, easy to add)

---

## 💻 Requirements

- Ruby 3.x  
- Rails 7.x or 8.x  
- SerpAPI account (free tier includes 100 searches/month)  
- SerpAPI API key (set in `.env` as `SERPAPI_API_KEY`)

---

## 🚀 Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/jobrocket.git
   cd jobrocket
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Set up `.env` with your SerpAPI key**
   ```bash
   echo 'SERPAPI_API_KEY=your_api_key_here' > .env
   ```

4. **Start the server**
   ```bash
   rails server
   ```

5. **Visit the app**
   ```
   http://localhost:3000
   ```

---

## 📦 Deployment

You can deploy this app to free hosts like:
- Render (render.com)  
- Fly.io (fly.io)  
- Railway (railway.app)  

For a free domain, you can use Freenom and point it to your host.

---

## 📄 Example `.env`

```
SERPAPI_API_KEY=YOUR_SERPAPI_KEY
```

---

## ⚙ Configuration

| Field         | Example                         |
|--------------|---------------------------------|
| Job Title    | Ruby on Rails, Game Developer   |
| Location     | New York, NY, United States     |
| Remote       | Yes / No                        |
| Language     | en, es, pt-br                  |
| Number of Jobs | 10, 20, 50, 100              |
| Date Posted  | past_24_hours, past_3_days, past_week, past_month |

---

## 🙏 Credits

- [Bootstrap](https://getbootstrap.com/)  
- [SerpAPI](https://serpapi.com/)  
- Ruby on Rails community ❤️

---

## 📃 License

This project is licensed under the MIT License.
