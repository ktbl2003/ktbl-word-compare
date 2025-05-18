<template>
    <div class="compare-container">
        <h2 class="title">KTBL文档操作</h2>
        <div class="grid-container">
            <div class="grid-item" :class="{ 'active': activeItem === 'compare' }" @click="openDialog('compare')"
                title="点击进行文档对比">
                <i class="el-icon-document"></i>
                <span>文档对比</span>
            </div>
            <div class="grid-item" :class="{ 'active': activeItem === 'compareSum' }" @click="openDialog('compareSum')"
                title="点击查看文档对比概述">
                <i class="el-icon-tickets"></i>
                <span>文档对比总结</span>
            </div>
            <div class="grid-item" :class="{ 'active': activeItem === 'adjust' }" @click="openDialog('adjust')"
                title="点击调整文档样式">
                <i class="el-icon-edit"></i>
                <span>文档样式调整</span>
            </div>
            <div class="grid-item" :class="{ 'active': activeItem === 'merge' }" @click="openDialog('merge')"
                title="点击进行文档合并">
                <i class="el-icon-files"></i>
                <span>文档合并</span>
            </div>
        </div>
        <component :is="currentDialog" v-if="showDialog" @close="closeDialog" />
    </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import Compare from './compare.vue';
import CompareSum from './compareSum.vue';
import Adjust from './adjust.vue';
import Merge from './merge.vue';

const showDialog = ref(true);
const currentDialog = ref(Compare);
const activeItem = ref('compare');

onMounted(() => {
    openDialog('compare');
});

const openDialog = (type: string) => {
    showDialog.value = true;
    activeItem.value = type;
    switch (type) {
        case 'compare':
            currentDialog.value = Compare;
            break;
        case 'compareSum':
            currentDialog.value = CompareSum;
            break;
        case 'adjust':
            currentDialog.value = Adjust;
            break;
        case 'merge':
            currentDialog.value = Merge;
            break;
    }
};

const closeDialog = () => {
    showDialog.value = false;
};
</script>

<style scoped>
.compare-container {
    max-width: 840px;
    margin: 0 auto;
    padding: 20px;
}

.title {
    text-align: center;
    margin-bottom: 20px;
}

.grid-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 16px;
    justify-items: center;
    margin-bottom: 20px;
}

.grid-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    cursor: pointer;
    transition: all 0.3s ease;
    width: 100%;
    max-width: 200px;
}

.grid-item:hover {
    box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.grid-item.active {
    border-color: #409eff;
    background-color: #ecf5ff;
}

.el-icon {
    font-size: 32px;
    margin-bottom: 8px;
}
</style>
