TELEP=$(pwd)

for f in css fonts js 
do
  if [ -L "${TELEP}/public/${f}" ]
  then
    echo "Link to ${f} already exists"
  else
    echo "Linking dist/${f} -> ${TELEP}/public/${f}"
    ln -s "${TELEP}/dist/${f}" "${TELEP}/public/${f}"
  fi
done

if [ -L "${TELEP}/views/index.ejs" ]
then
  echo "Link to index.html already exists"
else
  ln -s "${TELEP}/dist/index.html" "${TELEP}/views/index.ejs"
fi
