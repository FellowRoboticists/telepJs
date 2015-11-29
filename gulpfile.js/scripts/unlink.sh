TELEP=$(pwd)

for f in css fonts js 
do
  if [ -L "${TELEP}/public/${f}" ]
  then
    echo "Link to ${f} exists; deleting..."
    rm -f "${TELEP}/public/${f}"
  elif [ -d "${TELEP}/public/${f}" ]
  then
    echo "Directory ${f} exists; deleting..."
    rm -fr "${TELEP}/public/${f}"
  elif [ -f "${TELEP}/public/${f}" ]
  then
    rm "${FQP}/assets/${f}"
  fi
done

if [ -L "${TELEP}/views/index.ejs" ]
then
  rm -f "${TELEP}/views/index.ejs"
elif [ -f "${TELEP}/views/index.ejs" ]
then
  rm -f "${TELEP}/views/index.ejs"
fi
