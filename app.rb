system "clear"

require 'mysql2'

loop do
    puts "+----------------------------+"
    puts "|    O que quer fazer?       |"
    puts "+----------------------------+"
    puts "|  (1)Adicionar produtos     |"
    puts "|  (2)Comprar produtos       |"
    puts "|  (3)Ver produtos           |"
    puts "+----------------------------+"

    esco = gets.chomp.to_i

    if esco == 1
        puts "Nome da sua loja: "
        nomeloja = gets.chomp

        puts "Nome do seu produto: "
        nomeproduto = gets.chomp

        puts "Preço do seu produto"
        precoproduto = gets.chomp

        dbprodunew = Mysql2::Client.new(
            :host => "localhost",
            :username => "root",
            :database => "loja_cmd"
        )

        rs = dbprodunew.query("insert into lojapr(nomepro,precopro,nomeloja) values('#{nomeproduto}','#{precoproduto}','#{nomeloja}') ")
        puts "+++++PRODUTO ADICIONADO+++++"

    elsif esco == 2
        break
    elsif esco == 3
        dbproduver = Mysql2::Client.new(
            :host => "localhost",
            :username => "root",
            :database => "loja_cmd"
        )
            rd = dbproduver.query("select * from lojapr")

            rd.each do |row|
                puts "Loja: #{row["nomeloja"]}, Produto: #{row["nomepro"]}, Preço: #{row["precopro"]}"
            end
    end
end

prog = Sql.new




