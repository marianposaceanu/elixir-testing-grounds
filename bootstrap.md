## Install Erlang

Steps for Ubuntu are pretty easy to [follow](https://www.erlang-solutions.com/downloads/download-erlang-otp):

```
wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install erlang
```

Optional:

> HiPE stands for High-Performance Erlang Project. It is a native code compiler for Erlang. In most cases, it positively affects performance.


```
sudo apt-get install erlang-base-hipe
```

Try running erl and you should get back something like:

```
erl

Erlang/OTP 17 [erts-6.0] [source-07b8f44] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false]

```

Do note the [smp:4:4] this should equal the available number of logical cores you CPU supports. To get out of the Eshell use Ctrl+C and A

## Install Elixir from latest stable release

Just unzip the compiled archive from the [releases page](https://github.com/elixir-lang/elixir/releases/) and then just add the bins to PATH:

```
# in .bashrc

PATH="$PATH:/home/dakull/elixir/bin"

# then just to enable

source ~/.bashrc

# running iex should yield
iex
Interactive Elixir (0.14.2) - press Ctrl+C to exit (type h() ENTER for help)
```

## psql

```sql
CREATE DATABASE testdatabase;
\c testdatabase

CREATE TABLE comments(
   id int primary key      not null,
   user_name      char(50) not null,
   body           text     not null,
   created_at timestamp without time zone default (now() at time zone 'utc')
);

INSERT INTO comments (id,user_name,body) VALUES (1, 'Marian', 'Just a comment');
```


## Debug

```
iex -S mix
```
