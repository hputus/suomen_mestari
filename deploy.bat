npm run build
echo "remember to modify /js and /css to be css and js."
git add dist && git commit -m "adding dist subtree"
git subtree push --prefix dist origin gh-pages
