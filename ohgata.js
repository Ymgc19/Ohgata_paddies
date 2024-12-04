var geometry = 
    /* color: #d63000 */
    /* shown: false */
    ee.Geometry.Polygon(
        [[[139.98118353724726, 40.07035891618803],
          [139.97938109278925, 40.066286490436774],
          [139.96367407679804, 40.05938908506694],
          [139.96005512815282, 40.052293882496684],
          [139.95233036618993, 40.03665555072845],
          [139.9341342602329, 40.030740961148744],
          [139.93138767820165, 40.02364277659828],
          [139.9362800274448, 40.01036455997937],
          [139.94271732908055, 40.00780064634063],
          [139.94383312803075, 40.001883555019354],
          [139.93880848056057, 39.99793384823027],
          [139.9347958958743, 39.99270635530256],
          [139.9321538036155, 39.98611388343416],
          [139.92825699343177, 39.97449723367248],
          [139.92602140241559, 39.96733047870845],
          [139.92316753202374, 39.960571088336245],
          [139.9225667172044, 39.95826846701136],
          [139.92672875011732, 39.95279178529918],
          [139.9348826655226, 39.949189383687035],
          [139.94047748441596, 39.94638073656842],
          [139.94358884687324, 39.94412699040332],
          [139.94710790510078, 39.942794448622394],
          [139.95131193625133, 39.93963892599155],
          [140.01414000021617, 39.92463300964126],
          [140.0381725929896, 39.93411081324384],
          [140.05018888937633, 39.94464016702002],
          [140.05877195822399, 39.959378540305906],
          [140.06838499533336, 39.98305855787945],
          [140.0715397873155, 40.03944427977644],
          [140.05966537685185, 40.06153646612364],
          [140.01690151891341, 40.0817366140106],
          [140.00128033361068, 40.08744978171389],
          [139.99900582036605, 40.093260960375424],
          [139.98973610601058, 40.09418019742399],
          [139.98557331761947, 40.09335945065307]]]);


// Sentinel-1 データを取得
//取得する年のところを変えれば，各年のデータが取得できる．
// 3月下旬の偏波VH
var beforeFlood = ee.ImageCollection('COPERNICUS/S1_GRD')
  .filterBounds(geometry) // 地域を指定
  .filterDate('2024-03-15', '2024-04-01') // 取水前
  .filter(ee.Filter.eq('instrumentMode', 'IW'))
  .filter(ee.Filter.eq('orbitProperties_pass', 'DESCENDING'))
  .median();
  
var vhBefore = beforeFlood.select('VH');
var vhBeforeSmoothed = vhBefore.focal_mean({
  radius: 1, // 半径（ピクセル単位）
  units: 'pixels'
});

// 5月の偏波VH
//取得する年のところを変えれば，各年のデータが取得できる．
var afterFlood = ee.ImageCollection('COPERNICUS/S1_GRD')
  .filterBounds(geometry) // 地域を指定
  .filterDate('2024-05-01', '2024-05-30') // 取水後
  .filter(ee.Filter.eq('instrumentMode', 'IW'))
  .filter(ee.Filter.eq('orbitProperties_pass', 'DESCENDING'))
  .median();
var vhAfter = afterFlood.select('VH');
var vhafterSmoothed = vhAfter.focal_mean({
  radius: 1, // 半径（ピクセル単位）
  units: 'pixels'
});

// after - before
// afterの方が数値がお小さくなっているはず．後方散乱が小さいので．
// この値が小さいほど取水されているはず
var vhDifference = vhafterSmoothed.subtract(vhBeforeSmoothed);

// 可視化
Map.addLayer(afterFlood, {min: -30, max: 0}, 'After Flood (VH)');
Map.addLayer(vhDifference, {min: -10, max: 10, palette: ['white', 'skyblue', 'cyan', 'blue', 'black']}, 'VH Difference');Map.centerObject(beforeFlood, 10);


// 画像をエクスポート
// 5月のVHと3月下旬のVH差分
Export.image.toDrive({
    image: vhDifference,
    description: 'VH_diff',
    scale: 10,
    region: geometry,
    crs: 'EPSG:4326' 
    });

// 5月のVH
Export.image.toDrive({
    image: vhafterSmoothed,
    description: 'VH_after',
    scale: 10,
    region: geometry,
    crs: 'EPSG:4326' 
    });