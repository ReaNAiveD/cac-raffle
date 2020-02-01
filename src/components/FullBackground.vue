<template>
    <div class="bg-block">
        <div class="bg-image" :style="{ 'background-image' : 'url(' + src + ')' }"></div>
    </div>
</template>

<script>
    export default {
        name: "FullBackground",
        props: {
            src: String
        },
    }
</script>

<style scoped>
    .bg-block {
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: -1;
        position: fixed;
    }
    .bg-image {
        /*background: url("/grave-girl.jpg") no-repeat;*/
        width: 100%;
        height: 100%;
        background-size: cover;
        background-position-x: 50%;
        background-position-y: 0;
    }

</style>