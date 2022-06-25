npm run build
git add dist
git commit -m "adding dist subtree"
git push
git subtree push --prefix dist origin gh-pages
