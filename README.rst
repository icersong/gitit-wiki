Gitit WIKI 
============

Gitit WIKI: Git and Markdown based wiki, Bootstrap, ace Editor, syntax
highlight and docker deploy support.

Start Gitit-WIKI
=================

-  Normal install

   With gitit and git installed 

.. code:: bash

    git clone https://github.com/icersong/gitit-wiki ~/workspace/gitit;
    cd ~/workspace/gitit;
    cp sample.gitit.conf my-gitit.conf;
    ./run/run.sh start;

-  Docker install

.. code:: bash

    docker run -d --name gitit -p 3000:3000 icersong/gitit-wiki;

See: \ http://127.0.0.1:7500

Demo & Screeenshots
===================

Demos
-----

-  Gitit offical website:\ http://gitit.net

Screenshots
----------------

View
~~~~~~~~~

-  `view.png <https://github.com/icersong/gitit-wiki/blob/master/screenshots/view.png>`__
-  `view-ipad-mini.png <https://github.com/icersong/gitit-wiki/blob/master/screenshots/view-ipad-mini.png>`__
-  `view-iphone6.png <https://github.com/icersong/gitit-wiki/blob/master/screenshots/view-iphone6.png>`__

Edit
~~~~~~~~~

-  `edit.png <https://github.com/icersong/gitit-wiki/blob/master/screenshots/edit.png>`__
-  `edit-ipad-mini.png <https://github.com/icersong/gitit-wiki/blob/master/screenshots/edit-ipad-mini.png>`__
-  `edit-iphone6.png <https://github.com/icersong/gitit-wiki/blob/master/screenshots/edit-iphone6.png>`__

Gitit advantage
==============

-  No database
-  Git version control
-  Markdown formating
-  No limited sub folders
-  Support multi-launguage for folder title category
-  Support multi-launguage search
-  Support custom title
-  Support code highlight
-  Support formula
-  Support export epub pandoc ... 

More about Gitit install and optimization, please see:
- `gitit\_base.md
introduce and install
<https://github.com/icersong/gitit-wiki/blob/master/docs/gitit_base.md>`__
- `gitit\_config.md
configure <https://github.com/icersong/gitit-wiki/blob/master/docs/gitit_config.md>`__

Gitit WIKI improved Gitit
=====================

-  Bootstrap
-  Ace Editor
-  Ace Editor default formatting is ``markdown``\ 。
-  Support code highlight
-  Search & Replace (cmd+option+f)
-  Tab & recovery (tab、shift+tab)
-  Shortcut-key
-  ...

-  Support shortcut key on Markdown mode 
-  Math formula: Support MathJax enable/disable，custom MathJax source 
-  Code highlight: Supoort code highlight by highlight.js - Gitit need server support
-  Add auto git pull & push backup script

wikidata repostory
===================

请注意检查你的 ``wikidata/`` 目录的 git 配置。请注意： - ``wikidata``
文件夹是一个本地仓库，所有的 wiki 页面都将保存到此处； - ``Gitit``
启动时，会检查这个文件夹是否存在，如果不存在，Gitit
将会创建它，并初始化它为一个本地仓库 - 只有提交到仓库里的文件，才会被
Gitit 添加到 wiki 中。 -
如果你想要将此仓库与你的远程仓库绑定、同步：你需要： - clone 你的 wiki
仓库到 ``wikidata``
文件夹：\ ``git clone your-wikidata.git ./wikidata``\ ，或者： - 运行
``git remote`` 相关命令，使 ``wikidata`` 文件夹和你的远程仓库连接起来；

.. code:: bash

    # 如果  wikidata 文件夹尚不存在
    cd ~/workspace/gitit
    git clone your-wikidata.git ./wikidata
    git branch --set-upstream-to=origin/master master
    # 启动 gitit 服务: ./run/run.sh start

    # 如果 wikidata 已经存在，但并没有和你的远程仓库绑定
    cd wikidata
    git remote add origin path/to/your-wikidata.git
    git branch --set-upstream-to=origin/master master
    # 启动 gitit 服务: ./run/run.sh start

配置、自定义 JS/CSS
===================

Gitit Bigger 提供一定程度的配置。

你可以通过在 ``templates/page_more_scripts.st`` 里定义
``BIGGER_SETTINGS_APPEND`` 对象来覆盖默认配置。

包括： - ace 编辑器 - markdown - MathJax 数学公式插件 - highlightjs
代码高亮 - Google Analytics 统计

详情见：\ `gitit\_bigger\_config.md <https://github.com/icersong/gitit-wiki/blob/master/docs/gitit_bigger_config.md>`__

工具 Utils
==========

-  启动控制
-  批量修改扩展名
-  自动备份辅助

详情见：-
`gitit\_bigger\_utils.md <https://github.com/icersong/gitit-wiki/blob/master/docs/gitit_bigger_utils.md>`__

通过 Shell 编辑 wiki
====================

不通过 web界面，也可以操作我们的 Gitit Wiki。背景： 1. ``wikidata``:
wiki pages 的仓库 2. 只有提交到仓库里的文件，才会被 Gitit 添加到 wiki
中。

.. code:: bash


    # 进入 wikidata 目录
    cd /path/to/your/wikidata

    # 新增文件并输入一些字符串
    touch new_page.md
    echo "hello menduo" >> new_page.md

    # 添加新文件到仓库
    git add new_pge.md
    git commit -m "add new_page.md file"

    # 更新文件并提交到仓库
    echo "new line" >> old_page.md
    git add old_page.md
    git commit -m "update old_page.md "

    # 推送到远程仓库
    git push origin master

多个实例
========

通过配置文件的方式，可以轻松运行多个 Gitit 实例。除 wiki.menduo.net
外，我也运行了另外的实例来做私人笔记。 1.
``cp sample.gitit.conf my-gitit-private.conf;`` 2. 更新
``my-gitit-private.conf`` 里的相关配置，尤其是：端口、wikidata
目录（详见\ `gitit\_config.md
配置 <https://github.com/icersong/gitit-wiki/blob/master/docs/gitit_config.md>`__\ ）
3. 启动新实例：\ ``gitit -f my-gitit-private.conf``

注意 - 如果 ``my-gitit.conf`` 和 ``my-gitit-private.conf``
这两个实例使用不同的用户，可能会造成 cookies 的混乱。 -
在服务端时，可考虑使用 ``nginx``
做反向代理，为每个实例绑定一个二级域名。 - 在本地时，可以用
``localhost`` 和 ``127.0.0.1`` 一类的来处理 cookie 域问题。

Docs
====

-  `Gitit
   简介、安装、部署 <https://github.com/icersong/gitit-wiki/blob/master/docs/gitit_base.md>`__
-  `Gitit
   配置项介绍 <https://github.com/icersong/gitit-wiki/blob/master/docs/gitit_config.md>`__
-  `Gitit-Bigger-Docker
   版介绍 <https://github.com/icersong/gitit-wiki/blob/master/docs/gitit_bigger_docker.md>`__
-  `Gitit-Bigger
   定制说明 <https://github.com/icersong/gitit-wiki/blob/master/docs/gitit_bigger_config.md>`__
-  `Gitit-Bigger
   工具.md <https://github.com/icersong/gitit-wiki/blob/master/docs/gitit_bigger_utils.md>`__

Changelogs
==========

-  简体中文:
   `CHANGELOG.md <https://github.com/icersong/gitit-wiki/blob/master/CHANGELOG.md>`__
-  English:
   `CHANGELOG\_EN.md <https://github.com/icersong/gitit-wiki/blob/master/CHANGELOG_EN.md>`__

Feedback
================

-  Github Issues：\ https://github.com/icersong/gitit-wiki/issues
-  Email: icersong@gmail.com

Links
=====

-  Github：\ https://github.com/icersong/gitit-wiki
-  DockreHub：\ https://hub.docker.com/r/icersong/gitit-wiki
-  Demo: https://wiki.menduo.net/gitit-bigger (Read Only)
-  gitit official site: http://gitit.net
-  gitit official github: https://github.com/jgm/gitit
-  install gitit Wiki on Archlinux:
   http://www.360doc.com/content/12/0518/21/21412_211977928.shtml
-  Gitit - git based wiki:
   http://walkingice.blogspot.hk/2011/11/gitit-git-based-wiki.html
-  Hyzual/docker-gitit: https://github.com/Hyzual/docker-gitit
-  Gitit Bootstrap
   Template:\ `Changaco/gitit-bootstrap <https://github.com/Changaco/gitit-bootstrap>`__
-  Gitit ace editor 支持 `Getting the Ace editor to work with
   gitit <https://gist.github.com/lmullen/e2d2d4aabf84220c517a>`__
