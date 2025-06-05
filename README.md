# FreeCodeCamp Full Stack Certification Projects

This repository contains the projects I'm building as part of completing the newly formalized [freeCodeCamp Full Stack Developer Certification](https://www.freecodecamp.org/learn/).

I originally began working on the certification back in 2022, but with the recent updates and improved structure on freeCodeCamp, I’ve decided to go back through the basics with fresh eyes and greater intention. I'm excited to finish what I started — and to **document my progress** every step of the way.

Each folder in this repo links to a separate project, individually tracked with its own Git history using Git submodules. This allows me to keep things clean and modular as I move through each milestone.

## 📁 Projects

- [`recipe-page`](https://github.com/mjcaldev/recipe-page) — A simple and responsive HTML/CSS recipe site
- [`sample-blog`](https://github.com/mjcaldev/sample-blog) — A basic static blog layout project
- [`travel-agency`](https://github.com/mjcaldev/travel-agency) — A mock travel landing page with more advanced styling
- [`video-comp`](https://github.com/mjcaldev/video-comp) — A dynamic video UI component

## 🛠️ How to Clone This Repo (with Submodules)

If you'd like to explore the code or build it yourself, make sure to clone with submodules:

```bash
git clone --recurse-submodules https://github.com/mjcaldev/fccfscert.git
```

Or if you've already cloned it, initialize the submodules like this:

```bash
git submodule update --init --recursive
```
Feel free to follow along as I work through each project, refine my skills, and complete the certification. ✌️

## Workflow Template

I'll be using this workflow to maintain git modules as I work through this certification

``` bash
cd fccfscert
mkdir new-project
cd new-project
git init
# create files
git add .
git commit -m "Initial commit"
gh repo create mjcaldev/new-project --public --source=. --push
cd ..
git submodule add https://github.com/mjcaldev/new-project.git new-project
git add .gitmodules new-project
git commit -m "Add new-project as submodule"
git push
```

I will have to update both the submodule and main repo for each change

```bash
cd fccfscert/new-project
# make changes
git add .
git commit -m "Update something"
git push

cd ..
git add new-project
git commit -m "Update submodule pointer to latest commit"
git push

```

## As this is very "non-DRY", I made a script to automate (see add-fcc-project.sh)
