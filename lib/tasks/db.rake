namespace :db do
  task export_data: :environment do
    puts "Start export data"
    root_path = Rails.root.join("db", "masters")
    categories = CSV.open Rails.root.join(root_path, "categories.csv"), "wb"
    products = CSV.open Rails.root.join(root_path, "products.csv"), "wb"

    categories << ["id", "name"]
    products << ["id", "name", "price", "released_on", "category_id"]

    Category.all.each do |category|
      categories << [category.id, category.name]
    end

    Product.all.each do |product|
      products << [product.id, product.name, product.price, product.released_on, product.category_id]
    end

    categories.close
    products.close
    puts "Finish export data"
  end

  task recreate: :environment do
    list_tasks = case
    when Rails.env.development?
      %w[db:drop db:create db:migrate db:seed db:test:prepare]
    when Rails.env.staging?
      %w[db:drop db:create db:migrate db:seed]
    else
      Array.new
    end

    if list_tasks.any?
      list_tasks.each do |task|
        puts "\e[36mEXECUTE #{task} COMMAND\e[0m"
        Rake::Task[task].invoke
      end
    else
      puts "\e[31mdb:recreate task can be executed only in the development environment.\e[0m"
    end

    # puts "Clean old data"
    # [Product, Category].each do |model|
    #   ActiveRecord::Base.connection.execute "TRUNCATE #{model.table_name}"
    # end
    # puts "Finished clean old data"

    puts "Start import data"
    root_path = Rails.root.join("db", "masters")
    categories = CSV.read Rails.root.join(root_path, "categories.csv"), encoding: "UTF-8", headers: true
    products = CSV.read Rails.root.join(root_path, "products.csv"), encoding: "UTF-8", headers: true
    categories.each do |row|
      Category.create! row.to_h
    end

    products.each do |row|
      Product.create! row.to_h
    end

    puts "Finished import data"
  end
end
