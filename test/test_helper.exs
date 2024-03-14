Application.start(:inets)
Code.require_file("user_view.ex", "test/support/")

server_root = ~c"#{Path.absname("test/sample_pages")}"

ExUnit.start()
