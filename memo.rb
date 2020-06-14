# ハッシュ：pythonのdict的な感じのやつ
hash = {}
hash[:hoge] = "huga"
hash[:foo] = "bar"
puts hash


# シンボル：文字列と一対一対応するオブジェクト。文字を渡すと整数が戻るハッシュ関数をかましているのか？メモリ効率がよく、イミュータブル
# ハッシュのキーに使う


class Product
    attr_reader :name, :price

    def initialize(name, price)
        @name = name
        @price = price
    end

    # 特に何も書かずにオーバーライドできる
    def to_s
        "name: #{name}, price: #{price}"
    end

    private

    def say_hello
        "hello"
    end
end

class DVD < Product
    attr_reader :running_time
    # 定数。ミュータブルなものは、freeze（配列なら中身の要素も）しないと外から普通に書き換えられるので注意
    CONST_VAL = 0
    CONST_LST = ["Hoge", "Fuga", "Foo", "Bar"].map(&:freeze).freeze

    # クラスインスタンス変数。インスタンスメソッド内で共有されず、サブクラスでも共有されない
    @cls_instns_val = 11

    # クラス変数。インスタンスメソッドから呼んだりサブクラスから読んだりできる
    @@cls_val = 88

    # グローバル変数。どこからでも参照できるし変更もできる
    $glbl_bal = "global"


    # もしrunnning_timeがインスタンス変数になければ、superを呼ぶだけでも良い（そもそも再定義する必要もないが）。()をつけると、引数なしで呼ぶことになるので注意
    def initialize(name, price, running_time)
        super(name, price)
        @running_time = running_time
    end

    # 親クラスのをなかで呼びだしたり
    def to_s
        "#{super}, runnning_time: #{running_time}"
    end

    def say_hello_in_loud
        say_hello + "!!!!!"
    end

    # aliasも可能
    alias ha say_hello_in_loud

end

# publicメソッド：クラス外部からでも呼べる
# privateメソッド：クラス内部からのみ呼べる（hoge.say_hellみたいにレシーバを指定して呼べない）。class内でprivateを書いたところから下はprivateになる（インスタンスメソッドのみ）
# クラスメソッドをprivateにしたいなら、 class << self　とする
# publicと書いておいたらその下はpublicみたいなのも可能
# 普通に定義した後に、private_class_methd :say_hello でもprivateに変更できる
# privateはサブクラスでも呼び出せる（オーバーライドもできる）
# protectedは、そのクラスと、サブクラスのインスタンスメソッドからレシーバ付きで呼べる

dvd = DVD.new("hoge", 100, 123)
dvd2 = DVD.new("hoge", 100, 123)
puts dvd.say_hello_in_loud
puts dvd.ha

a = 1
b = 1.0
# equal?は参照している対象が同じ場合true
puts a.equal?(b)
# == は中身の値が同じならtrue
puts a == b

# 特異メソッド：特定のオブジェクトだけメソッド追加したりできる
def dvd.say_good_morning
    puts "good_morning"
end
dvd.say_good_morning
# dvd2.say_good_morning # dvd2には say_good_morningメソッドがないので undefined_methodで怒られる

# オブジェクトのクラスに依らず、そのメソッドが呼び出せたら別にいいじゃん：ダックタイピング

# モジュールはクラスでincludeすれば、モジュールに属するメソッドとか使えるようになるから、異なるクラスの共通の処理を持たせたりできる
# 多重継承がないかわりに、moduleで共通処理を差し込んだりできる（publicとかprivateとかの指定もmodule宣言時にやっておく）
# Class名.include?(module名)で、includeされているかどうか、Class名.included_modulesでincludeされてるものの配列が戻される
module Hoge
    def say_hoge
        "hogehoge"
    end

    # include先で、say_nameが定義されていることを期待してこんな書き方してもよい。say_nameにselfをつけてもよい（selfはinclude先のクラスのインスタンス）
    def use
        "I am " + say_name
    end
end

module Foo
    def say_foo
        "Foooooooo!"
    end
end

class Fuga
    include Hoge

    # extendで特異メソッド（クラスメソッド）を作ったりもできる
    extend Foo
    def say_name
        "Foo"
    end
    
end

fuga = Fuga.new
puts fuga.say_hoge
puts Fuga.say_foo
puts fuga.use