# decode_url = require '../decodeurl.coffee'
us = require 'underscore'

a = 'abc'
us.map a, (i) ->
  console.log i




# a = "http://www.baidu.com/s?wd=%E4%BE%9B%E5%BA%94%E9%93%BE%E7%BD%91%E7%BB%9C%E8%A7%84%E5%88%92%E6%A1%88%E4%BE%8B%E5%88%86%E6%9E%90%3A%E6%90%9C%E9%9B%86%E6%9F%90%E5%AE%B6%E4%BC%81%E4%B8%9A%E4%BE%9B%E5%BA%94%E9%93%BE%E7%BD%91%E7%BB%9C%E8%A7%84%E5%88%92%E6%A1%88%E4%BE%8B%2C%E5%88%86%E6%9E%90%E4%BE%9B%E5%BA%94%E9%93%BE%E7%BD%91%E7%BB%9C%E8%A7%84%E5%88%92%E5%AF%B9%E4%BC%81&pn=90&oq=%E4%BE%9B%E5%BA%94%E9%93%BE%E7%BD%91%E7%BB%9C%E8%A7%84%E5%88%92%E6%A1%88%E4%BE%8B%E5%88%86%E6%9E%90%3A%E6%90%9C%E9%9B%86%E6%9F%90%E5%AE%B6%E4%BC%81%E4%B8%9A%E4%BE%9B%E5%BA%94%E9%93%BE%E7%BD%91%E7%BB%9C%E8%A7%84%E5%88%92%E6%A1%88%E4%BE%8B%2C%E5%88%86%E6%9E%90%E4%BE%9B%E5%BA%94%E9%93%BE%E7%BD%91%E7%BB%9C%E8%A7%84%E5%88%92%E5%AF%B9%E4%BC%81&tn=98050039_dg&ie=utf-8&rsv_page=1"
# a = "http://www.baidu.com/s?wd=%E5%B8%B8%E8%8C%82%E5%BE%95&pn=260&oq=%E5%B8%B8%E8%8C%82%E5%BE%95&ie=utf-8&rsv_idx=1&f=8&rsv_bp=1&tn=baidu"
# a = "http%3A%2F%2Fwww.tushucheng.com%2Faw%2Fbook%2F4851503.html&referer=&d=1414570350875&default HTTP/1.1"
# a = "http://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&rsv_idx=1&tn=baidu&wd=9787508340906&bs=%E5%86%9C%E7%94%B5%E4%B8%89%E5%A4%A7%E8%A7%84%E7%A8%8B%E5%9F%B9%E8%AE%AD%E6%95%99%E7%A8%8B&d=1414633933172&default HTTP/1.1"
# a = "14.145.252.120 - - [30/Oct/2014:10:01:59 +0800] \"GET /log/detail.html?url=http://www.tushucheng.com/book/2821259.html&referer=http://www.baidu.com/s?wd=%E6%8E%A8%E8%8D%90%20%E7%AE%A1%E7%90%86%E6%B3%95%E5%88%99%20%E4%B9%A6&pn=30&oq=%E6%8E%A8%E8%8D%90%20%E7%AE%A1%E7%90%86%E6%B3%95%E5%88%99%20%E4%B9%A6&tn=site888_pg&ie=utf-8&d=1414634756343&type=DT&detailPage&bookId=2821259&userid=0 HTTP/1.1\" 200 0 \"http://www.tushucheng.com/book/2821259.html\" \"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0)\""
# a = """
# 14.145.252.120 - - [30/Oct/2014:10:01:59 +0800] "GET /log/detail.html?url=http%3A%2F%2Fwww.tushucheng.com%2Fbook%2F2821259.html&referer=http%3A%2F%2Fwww.baidu.com%2Fs%3Fwd%3D%25E6%258E%25A8%25E8%258D%2590%2520%25E7%25AE%25A1%25E7%2590%2586%25E6%25B3%2595%25E5%2588%2599%2520%25E4%25B9%25A6%26pn%3D30%26oq%3D%25E6%258E%25A8%25E8%258D%2590%2520%25E7%25AE%25A1%25E7%2590%2586%25E6%25B3%2595%25E5%2588%2599%2520%25E4%25B9%25A6%26tn%3Dsite888_pg%26ie%3Dutf-8&d=1414634756343&type=DT&detailPage&bookId=2821259&userid=0 HTTP/1.1" 200 0 "http://www.tushucheng.com/book/2821259.html" "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0)"
# """
# a = """
# GET /log/detail.html?url=http%3A%2F%2Fwww.tushucheng.com%2Fbook%2F2821259.html&referer=http%3A%2F%2Fwww.baidu.com%2Fs%3Fwd%3D%25E6%258E%25A8%25E8%258D%2590%2520%25E7%25AE%25A1%25E7%2590%2586%25E6%25B3%2595%25E5%2588%2599%2520%25E4%25B9%25A6%26pn%3D30%26oq%3D%25E6%258E%25A8%25E8%258D%2590%2520%25E7%25AE%25A1%25E7%2590%2586%25E6%25B3%2595%25E5%2588%2599%2520%25E4%25B9%25A6%26tn"
# """
# # a = """
# # GET /log/detail.html?url=http%3A%2F%2Fwww.tushucheng.com%2Fbook%2F2821259.html&referer=http%3A%2F%2Fwww.baidu.com%2Fs%3Fwd%3D%25E6"
# # """
# # console.log "+++"+a+"+++"
# a = """
# 101.226.89.123 - - [30/Oct/2014:12:11:27 +0800] "GET /log/detail.html?url=http://www.tushucheng.com/book/4902457.html&referer=http://www.sogou.com/sogou?pid=Af99046&query=%D4%DAfldlc%CC%F5%BC%FE%CF%C2%B9%CD%D6%F7%A1%A2%B9%A4%B3%CC%CA%A6%BC%B0%B3%D0%B0%FC%C9%CC%B5%C4%C8%A8%C1%A6%D3%EB%D6%B0%D4%F0&p=50040111&oq=&ri=-2&d=1414640594837&type=DT&detailPage&bookId=4902457&userid=0 HTTP/1.1" 200 0 "http://www.tushucheng.com/book/4902457.html" "Mozilla/4.0"
# """

# a = "%CC%F5%BC%FE%CF%C2%B9%CD%D6%F7%A1%A2%B9%A4%B3%CC%CA%A6%BC%B0%B3%D0%B0%FC%C9%CC%B5%C4%C8%A8%C1%A6%D3%EB%D6%B0%D4%F0"
# console.log  decode_url(a)