class User
  attr_accessor :name, :email
  #attr_accessorはrubyの組み込みライブラリのmoduleクラスに定義されているメソッド
  #引数にインスタンス変数を取り,その変数に対し読み取りメソッドと書き込みメソッドの両方を定義する

  def initialize(attributes = {})
    #引数に初期値を設定している
    #initializeメソッドはrubyのメソッド
    #オブジェクトを作成時に必ず実行したい処理をinitialzeメソッド内にかく
    @name = attributes[:name]
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name}<#{@email}>"
  end
end
