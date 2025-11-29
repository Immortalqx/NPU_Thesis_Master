# README

原始的 `yanputhesis` 模板中，示例主文件是：`yanputhesis-sample.tex`。
如果在这个文件上直接改论文内容，一旦执行某些 `make` 目标（例如 `make sample` / `make samplebib` / `make main`），模板有可能重新生成示例文件，从而**覆盖已经修改好的 `yanputhesis-sample.tex`**，存在潜在风险。

为避免这个问题，本模板做了两点改动：

1. 新增一个**独立的用户主文件**：`main.tex`

   写论文在 `main.tex` 和sec子文件夹中的文件中修改编辑；

2. 修改 `makefile`：

   默认命令 `make` 会编译 `main.tex`（带参考文献），生成 `main.pdf`；

在项目根目录下（包含 `makefile` 和 `main.tex` 的目录），终端中输入：

- 编译论文（推荐，含 BibTeX）：

  ```bash
  make
  ```

  或

  ```bash
  make mainbib
  ```

- 快速编译（不跑 BibTeX，只更新正文）：

  ```bash
  make main
  ```

- 清理中间文件：

  ```bash
  make clean
  ```

