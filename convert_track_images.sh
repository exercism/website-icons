pushd tracks
rm -rf track-images
mkdir -p track-images
for img in logos/!(*-t.png);
do echo $img
  for shapeFile in bordered-green.png hex-green.png bordered-turquoise.png hex-turquoise.png;
  do echo $shapeFile
    track=`basename $img .png`
    shape=`basename $shapeFile .png`
    output=$track-$shape.png
    composite $img shapes/$shapeFile "track-images/$output"
  done
done
for img in logos/*-t.png;
do echo $img
  track=`basename $img -t.png`
  output="$track-hex-white.png"
  composite $img shapes/hex-white.png "track-images/$output"
done
for shapeFile in bordered-green.png hex-green.png bordered-turquoise.png hex-turquoise.png hex-white.png;
  do cp "shapes/$shapeFile" "track-images/default-$shapeFile"
done
popd


aws s3 sync --profile exercism --acl public-read tracks/track-images s3://exercism-static/tracks
