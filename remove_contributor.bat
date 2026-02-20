@echo off
echo ========================================
echo REMOVING BURHANMOHAMMAD FROM PORTFOLIO
echo ========================================
echo.
echo This script will create a fresh git history
echo without BurhanMohammad as a contributor.
echo.
pause

cd /d "C:\Users\tony8\PycharmProjects\Django-Portfolio-website"

echo Step 1: Backing up current work...
git add .
git commit -m "Backup before fresh start"

echo.
echo Step 2: Removing old git history...
rmdir /s /q .git

echo.
echo Step 3: Initializing fresh repository...
git init
git branch -M main

echo.
echo Step 4: Adding files with Anthony as sole contributor...
git add .
git commit -m "Initial commit - Anthony Richards Portfolio Website"

echo.
echo Step 5: Adding remote repository...
git remote add origin https://github.com/Tony82122/Portfolio.git

echo.
echo Step 6: Force pushing fresh history...
git push -f origin main

echo.
echo ========================================
echo SUCCESS! BurhanMohammad removed!
echo ========================================
echo.
echo Your repository now shows only YOU as contributor!
echo Check: https://github.com/Tony82122/Portfolio
echo.
pause
