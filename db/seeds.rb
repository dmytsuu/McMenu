products_file = File.open("#{Rails.root}/public/mcdonalds.json")
products = JSON.load(products_file)
products.keys.each do |kind|
  products[kind].each do |product|
    Product.create(name: product['name'], price: product['price'], image: product['image'], kind: kind)
  end
end
