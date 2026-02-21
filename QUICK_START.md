# Quick Start Guide - Anthony Richards Portfolio

## Your portfolio is ready to launch!

### Step 1: Open PowerShell/Terminal
Open a PowerShell window or Command Prompt in your project directory.

### Step 2: Ensure Virtual Environment is Activated
You should see `(venv)` at the start of your terminal prompt. If not, run:
```bash
venv\Scripts\activate
```

### Step 3: Run the Server
```bash
python manage.py runserver
```

### Step 4: Open in Browser
Visit: **http://localhost:8000/**

Your portfolio will display at this address!

---

## Access the Admin Panel
Visit: **http://localhost:8000/admin/**

You can manage your portfolio content here.

---

## What's Ready

✅ Portfolio homepage personalized with your information
✅ About section with your background
✅ Skills section with your technical skills
✅ Resume section with your work experience and education
✅ Projects section showcasing your work
✅ Contact form for visitors to reach you

---

## Your Information Currently On Site

**Name:** Anthony Richards
**Title:** Junior Software Developer / Backend Engineer
**Location:** Aarhus, Denmark
**Email:** tony82122@gmail.com
**GitHub:** https://github.com/Tony8212

**Experience:**
- Software Engineering Intern at Boozt Technology (Aug 2025 - Jan 2026)
- Sous Chef / Head Chef (2012 - 2022)

**Education:**
- Bachelor in Software Technology Engineering (VIA University College)
- Python Efficiency (Cisco Networking Academy)

**Key Skills:** Java, Python, PHP, Go, C#, PostgreSQL, REST APIs, Git, CI/CD, Django

---

## Troubleshooting

**If port 8000 is in use:**
```bash
python manage.py runserver 8001
```
Then visit: http://localhost:8001/

**If migrations fail:**
```bash
python manage.py migrate
```

**To stop the server:**
Press `CTRL + C` in your terminal

---

## Next Steps

1. ✅ Your portfolio is personalized and ready
2. Add your projects to the Projects section via admin panel
3. Upload a better profile image if needed
4. Consider deploying it online (Heroku, PythonAnywhere, etc.)
5. Update contact information if needed

Enjoy your portfolio!

