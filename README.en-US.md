<div align="center">

[//]: # (  <img alt="vue3-element-admin" width="80" height="80" src="./src/assets/logo.png">)
  <h1>ktbl-word-compare</h1>

</div>

![](https://foruda.gitee.com/images/1708618984641188532/a7cca095_716974.png "rainbow.png")
<div align="center">
  <a target="_blank" href="#">🖥️ 在线预览</a> |  <a target="_blank" href="#">📑 阅读文档</a> | <a href="./README.en-US.md">💬 English
</div>
## 项目简介


KTBL文档比较是一套半语义替换式的Word文档比较工具，采用独特比对算法，把市面基于词的删除-增加方式优化为基于目录-段-词的替换方式，通过批注展现比较的结果，不但解决文档比对内容的大篇幅错位，还能对文档的内容、表格等基本上作到无侵入和破坏。对于改动较大的大文档而言，其比对效果尤其明显。
下载地址：https://www.alipan.com/s/LyvUPFfyCh2
## 项目特色

- **扩展比对模式**：目前的word对比工具都是相等、删除、增加三种方式，当前工具改造算法，增加修改方式。文档中修改内容不再是删除-增加联合表述出来，而是直接替换，修改的内容会被标注出来。
- **比对结果更精准**：目前word对比工具都是一般都是采用基于词或字符的相关算法，对于稍复杂的文档，比对结果会出现错行或大面积的错位，当前工具采用基于目录-段-词的及分级回溯方式，结果会更加精准。
- **无侵入的对比**：目前Word对比工具基本上都是合并两份文档，对比的结果文档难于阅读，复杂的文档及改动较大文档尤其难于阅读，当前工具采用采用标注的方式，文档的内容、表格等基本上作到无侵入和破坏。
- **批注式对比**：对比结果采用批注的显示，比对之前文档简单清晰。
- **支持图片对比**：支持图片的对比，图片的对比会显示出图片的新增、删除、修改（TODO)。
- **支持表格对比**：支持文档的对比，文档的对比会显示出文档的新增、删除、修改。
- **支持文档合并**：支持文档的合并，文档的合并会将文档的新增、删除、修改合并到一起(TODO)。


## 项目截图



## 项目启动

```bash
# 克隆代码
git clone https://github.com/ktbl2003/ktbl-work-compare.git


# 前台
cd ktbl-work-compare
cd kbtl-vue

# 安装 pnpm
npm install pnpm -g

# 设置镜像源(可忽略)
pnpm config set registry https://registry.npmmirror.com

# 安装依赖
pnpm install -f

# 启动运行
npm run dev


#后台 为spring-boot3+jdk17,先安装java 环境，以IDE工具运行即可
```
