MVVMDemo.  用UITableView来展示 

MVVM 是一个相当不错的架构模式。

MVVM介绍 

http://www.cnblogs.com/brycezhang/p/3840567.html

Model: 数据的模型

View: 其实包括View和ViewController两部分，统称为View

ViewModel: 本Demo，主要是处理网络请求，把获取的数据显示在TableView上

TableViewProtocol: 为了避免ViewController太重，我把DataSource和Delegate抽离出来
