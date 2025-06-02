<template>
  <div class="form-container" v-loading="loading" element-loading-text="正在比较文档，请稍候...,约需要需要一到二分钟"
       element-loading-background="rgba(0, 0, 0, 0.7)">
    <el-form :model="form" label-width="120px" class="form-content">
      <!-- 原文档上传 -->
      <el-form-item label="原始文档">
        <el-input v-for="file in originalFileList" :key="file.uid" :value="file.name" readonly
                  style="width:400px;margin-right:10px;"/>
        <el-upload :action="uploadUrl" :on-success="handleOriginalSuccess" :on-error="handleUploadError"
                   :show-file-list="false" :limit="1">
          <el-button type="primary">选择</el-button>
        </el-upload>
      </el-form-item>

      <!-- 修改后文档上传 -->
      <el-form-item label="改后文档">
        <el-input v-for="file in modifiedFileList" :key="file.uid" :value="file.name" readonly
                  style="width:400px;margin-right:10px;"/>
        <el-upload :action="uploadUrl" :on-success="handleModifiedSuccess" :on-error="handleUploadError"
                   :show-file-list="false" :limit="1">
          <el-button type="primary">选择</el-button>
        </el-upload>
      </el-form-item>

      <!-- 新增总结复选框 -->
      <!--      <el-form-item label="文档修改总结">-->
      <el-checkbox v-model="generateSummary" size="large">
        生成文档修改总结
      </el-checkbox>
      <!--      </el-form-item>-->
    </el-form>
    <div style="text-align: center;">
      <el-button type="primary" @click="handleCompare" :disabled="!originalFileId || !modifiedFileId">
        开始比较
      </el-button>
    </div>
  </div>
</template>

<script setup lang="ts">
import {ref} from 'vue'
import {ElMessage, UploadFile} from 'element-plus'

const originalFileList = ref<UploadFile[]>([])
const modifiedFileList = ref<UploadFile[]>([])
originalFileList.value = [{uid: "", name: ""}];
modifiedFileList.value = [{uid: "", name: ""}];
// 新增响应式变量
const generateSummary = ref(false)
const uploadUrl = (window.VITE_APP_API_URL || import.meta.env.VITE_APP_API_URL) + "/api/upload";
const compareUrl = (window.VITE_APP_API_URL || import.meta.env.VITE_APP_API_URL) + "/api/compare"// 假设这个是你的比较API的URL
console.log(uploadUrl, compareUrl)
const form = ref({})
const originalFileId = ref('')
const modifiedFileId = ref('')
const compareResult = ref('')
const loading = ref(false)

const handleOriginalSuccess = (response: any, uploadFile: UploadFile) => {
  originalFileList.value = [uploadFile]
  originalFileId.value = response.data
  // alert(originalFileId.value)
  ElMessage.success('原文档上传成功')
}

const handleModifiedSuccess = (response: any, uploadFile: UploadFile) => {
  modifiedFileList.value = [uploadFile]
  modifiedFileId.value = response.data
  // alert(modifiedFileId.value)
  ElMessage.success('修改后文档上传成功')
}

const handleUploadError = () => {
  ElMessage.error('文件上传失败')
}
const handleCompare = async () => {
  try {
    loading.value = true
    const response = await fetch(compareUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/octet-stream' // 添加接受二进制流类型
      },
      body: JSON.stringify({
        original: originalFileId.value,
        modified: modifiedFileId.value,
        summary: generateSummary.value ? 1 : 0
      })
    });

    // 获取blob对象
    const blob = await response.blob();
    // 创建临时下载链接
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    // 从响应头获取文件名
    const filename = response.headers.get('Content-Disposition')?.split('filename=')[1] || 'compare_result.docx';
    a.download = decodeURIComponent(filename);
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    window.URL.revokeObjectURL(url);

    ElMessage.success('文档比较完成，文件下载已开始'); // 修改成功提示语
    // ElMessage.success('文件下载成功');
  } catch (error) {
    ElMessage.error('比较失败');
  } finally {
    loading.value = false
  }
}

</script>

<style scoped>
.title {
  text-align: center;
  margin-bottom: 20px;
  color: var(--el-color-primary);
  font-size: 24px;
  font-weight: bold;
}

.form-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100%;
  background: var(--el-bg-color-page);
  border: 1px solid var(--el-border-color);
  border-radius: 4px;
  padding-bottom: 20px;
}

.form-content {
  width: 800px;
  padding: 20px;


}

.result-box {
  padding: 20px;
  background: var(--el-bg-color-page);
  border-radius: 4px;
  max-height: 400px;
  overflow: auto;
}
</style>
