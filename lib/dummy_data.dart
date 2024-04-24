import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/utils/constants/image_strings.dart';

List<Map<String, dynamic>> dummyCategories = [
  {"image": TImages.sportIcon, "name": "Sports"},
  {"image": TImages.furnitureIcon, "name": "Furniture"},
  {"image": TImages.electronicsIcon, "name": "Electronics"},
  {"image": TImages.clothIcon, "name": "Clothes"},
  {"image": TImages.animalIcon, "name": "Toys"},
  {"image": TImages.shoeIcon, "name": "Shoes"},
  {"image": TImages.cosmeticsIcon, "name": "Cosmetics"},
  {"image": TImages.jeweleryIcon, "name": "Jewelery"},
];

List<Map<String, dynamic>> dummyBrands = [
  {"image": TImages.nikeLogo, "name": "Nike", "count": "256"},
  {"image": TImages.adidasLogo, "name": "Adidas", "count": "200"},
  {"image": TImages.appleLogo, "name": "Apple", "count": "400"},
  {"image": TImages.jordanLogo, "name": "Jordan", "count": "500"},
  {"image": TImages.pumaLogo, "name": "Puma", "count": "456"},
  {"image": TImages.zaraLogo, "name": "Zara", "count": "234"},
  {"image": TImages.kenwoodLogo, "name": "Kenwood", "count": "123"},
  {"image": TImages.hermanMillerLogo, "name": "HermanMiller", "count": "453"},
];

List<ProductModel> dummyProducts = [
  const ProductModel(
      id: 1,
      title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      price: 1109.95,
      description:
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      category: "men's clothing",
      image: "assets/images/products/Fjallraven.jpg",
      rating: Rating(rate: 3.9, count: 120)),
  const ProductModel(
      id: 2,
      title: "Mens Casual Premium Slim Fit T-Shirts ",
      price: 222.3,
      description:
          "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
      category: "men's clothing",
      image: "assets/images/products/t_shirt_1.jpg",
      rating: Rating(rate: 4.1, count: 259)),
  const ProductModel(
      id: 3,
      title: "Mens Cotton Jacket",
      price: 535.99,
      description:
          "great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.",
      category: "men's clothing",
      image: "assets/images/products/t_shirt_2.jpg",
      rating: Rating(rate: 4.7, count: 500)),
  const ProductModel(
      id: 4,
      title: "Mens Casual Slim Fit",
      price: 1523.99,
      description:
          "The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.",
      category: "men's clothing",
      image: "assets/images/products/t_shirt_3.jpg",
      rating: Rating(rate: 2.1, count: 430)),
  const ProductModel(
      id: 5,
      title:
          "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
      price: 695,
      description:
          "From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.",
      category: "jewelery",
      image: "assets/images/products/jew1.jpg",
      rating: Rating(rate: 4.6, count: 400)),
  const ProductModel(
      id: 6,
      title: "Solid Gold Petite Micropave ",
      price: 1683,
      description:
          "Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.",
      category: "jewelery",
      image: "assets/images/products/jew2.jpg",
      rating: Rating(rate: 3.9, count: 70)),
  const ProductModel(
      id: 7,
      title: "White Gold Plated Princess",
      price: 933.99,
      description:
          "Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine's Day...",
      category: "jewelery",
      image: "assets/images/products/jew3.jpg",
      rating: Rating(rate: 3, count: 400)),
  const ProductModel(
      id: 8,
      title: "Pierced Owl Rose Gold Plated Stainless Steel Double",
      price: 1430.99,
      description:
          "Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel",
      category: "jewelery",
      image: "assets/images/products/jew4.jpg",
      rating: Rating(rate: 1.9, count: 100)),
  const ProductModel(
      id: 9,
      title: "WD 2TB Elements Portable External Hard Drive - USB 3.0 ",
      price: 2364,
      description:
          "USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system",
      category: "electronics",
      image: "assets/images/products/ele1.jpg",
      rating: Rating(rate: 3.3, count: 203)),
  const ProductModel(
      id: 10,
      title: "SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s",
      price: 1209,
      description:
          "Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5” hard drive; Based on published specifications and internal benchmarking tests using PCMark vantage scores) Boosts burst write performance, making it ideal for typical PC workloads The perfect balance of performance and reliability Read/write speeds of up to 535MB/s/450MB/s (Based on internal testing; Performance may vary depending upon drive capacity, host device, OS and application.)",
      category: "electronics",
      image: "assets/images/products/ele2.jpg",
      rating: Rating(rate: 2.9, count: 470)),
  const ProductModel(
      id: 11,
      title:
          "Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5",
      price: 1309,
      description:
          "3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.",
      category: "electronics",
      image: "assets/images/products/ele3.jpg",
      rating: Rating(rate: 4.8, count: 319)),
  const ProductModel(
      id: 12,
      title:
          "WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive",
      price: 1214,
      description:
          "Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer's limited warranty",
      category: "electronics",
      image: "assets/images/products/ele4.jpg",
      rating: Rating(rate: 4.8, count: 400)),
  const ProductModel(
      id: 13,
      title: "Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin",
      price: 5939,
      description:
          "21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz",
      category: "electronics",
      image: "assets/images/products/ele5.jpg",
      rating: Rating(rate: 2.9, count: 250)),
  const ProductModel(
      id: 14,
      title:
          "Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED ",
      price: 999.99,
      description:
          "49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch screen side by side QUANTUM DOT (QLED) TECHNOLOGY, HDR support and factory calibration provides stunningly realistic and accurate color and contrast 144HZ HIGH REFRESH RATE and 1ms ultra fast response time work to eliminate motion blur, ghosting, and reduce input lag",
      category: "electronics",
      image: "assets/images/products/ele6.jpg",
      rating: Rating(rate: 2.2, count: 140)),
  const ProductModel(
      id: 15,
      title: "BIYLACLESEN Women's 3-in-1 Snowboard Jacket Winter Coats",
      price: 526.99,
      description:
          "Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together It is suitable for different season and help you adapt to different climates",
      category: "women's clothing",
      image: "assets/images/products/w1.jpg",
      rating: Rating(rate: 2.6, count: 235)),
  const ProductModel(
      id: 16,
      title:
          "Lock and Love Women's Removable Hooded Faux Leather Moto Biker Jacket",
      price: 229.95,
      description:
          "100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON",
      category: "women's clothing",
      image: "assets/images/products/w2.jpg",
      rating: Rating(rate: 2.9, count: 340)),
  const ProductModel(
      id: 17,
      title: "Rain Jacket Women Windbreaker Striped Climbing Raincoats",
      price: 329.99,
      description:
          "Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn't overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look.",
      category: "women's clothing",
      image: "assets/images/products/w3.jpg",
      rating: Rating(rate: 3.8, count: 679)),
  const ProductModel(
      id: 18,
      title: "MBJ Women's Solid Short Sleeve Boat Neck V ",
      price: 933.85,
      description:
          "95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem",
      category: "women's clothing",
      image: "assets/images/products/w4.jpg",
      rating: Rating(rate: 4.7, count: 130)),
  const ProductModel(
      id: 19,
      title: "Opna Women's Short Sleeve Moisture",
      price: 734.95,
      description:
          "100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort",
      category: "women's clothing",
      image: "assets/images/products/w5.jpg",
      rating: Rating(rate: 4.5, count: 146)),
  const ProductModel(
      id: 20,
      title: "DANVOUY Womens T Shirt Casual Cotton Short",
      price: 123.99,
      description:
          "95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.",
      category: "women's clothing",
      image: "assets/images/products/w6.jpg",
      rating: Rating(rate: 3.6, count: 145))
];
