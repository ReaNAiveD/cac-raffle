<template>
    <div id="app">
        <FullBackground :src="backgroundSrc"/>
<!--        <img alt="Vue logo" src="./assets/logo.png">-->
<!--        <HelloWorld msg="Welcome to Your Vue.js App"/>-->
        <div class="layout-grid">
            <div class="raffle">
                <Raffle :num-style="numStyle" :max-num="maxNum" :cell-color="backColor"/>
            </div>
        </div>
        <div class="bottom-line">
            <input id="max-input" type="number" @change="maxChange" value="999">
            <input id="change-pic-input" style="display:none" type="file" class="change-pic-button" accept="image/*" @change="picChosen">
            <button class="change-pic-button" @click="changePic"><img alt="chang-pic" style="height: 40px" src="./assets/change-pic.png"/></button>
            <el-color-picker class="color-picker" v-model="backColor" show-alpha/>
            <div class="copyright">©NAIVED</div>
        </div>
    </div>
</template>

<script>
    // import HelloWorld from './components/HelloWorld.vue'
    import FullBackground from "@/components/FullBackground";
    // import RandomCell from "@/components/RandomCell";
    import Raffle from "@/components/Raffle";
    export default {
        name: 'app',
        components: {
            Raffle,
            // RandomCell,
            // HelloWorld,
            FullBackground
        },
        data() {
            return {
                backgroundSrc: '/grave-girl.jpg',
                maxNum: 999,
                backColor: 'rgba(185,120,204,0.4)',
                numStyle: {
                    color: 'rgba(240,255,240,0.75)',
                    textShadow: '0 0 40px rgba(15, 0, 15, 0.6)',
                    fontSize: '280px'
                }
            }
        },
        methods: {
            changePic: function () {
                let changeInput = document.getElementById('change-pic-input');
                window.console.log(changeInput);
                changeInput.click();
            },
            picChosen: function () {
                let changeInput = document.getElementById('change-pic-input');
                let selectedFile = changeInput.files[0];
                this.backgroundSrc = this.getObjectURL(selectedFile);
            },
            getObjectURL: function (file) {
                let url = null;
                if (window.createObjectURL !== undefined) {
                    url = window.createObjectURL(file);
                } else if (window.URL !== undefined) {
                    url = window.URL.createObjectURL(file);
                } else if (window.webkitURL !== undefined) {
                    url = window.webkitURL.createObjectURL(file);
                }
                return url;
            },
            maxChange: function (newNum) {
                window.console.log(newNum);
                this.maxNum = Math.floor(newNum.target.valueAsNumber);
            }
        }
    }
</script>

<style>
    #app {
        font-family: 'Avenir', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;
    }

    .raffle {
        height: 50vh;
        width: 100%;
        margin-top: 15vh;
        padding: 20px;
    }

    @media screen and (min-width:480px){
        .layout-grid {
            display: grid;
            grid-template-columns: 3fr;
        }
    }/* 超小设备（手机，小于 768px） */

    @media screen and (min-width:768px) {
        .layout-grid {
            display: grid;
            grid-template-columns: 3fr 2fr;
        }
    } /* 小型设备（平板电脑，768px 起） */

    @media screen and (min-width:992px){
        .layout-grid {
            display: grid;
            grid-template-columns: 3fr 2fr;
        }
    }/* 中型设备（台式电脑，992px 起） */

    @media screen and (min-width:1200px){
        .layout-grid {
            display: grid;
            grid-template-columns: 3fr 2fr;
        }
    }/* 大型设备（大台式电脑，1200px 起） */

    .bottom-line{
        position: absolute;
        left: 0;
        right: 0;
        bottom: 0;
        height: 50px;
        background-color: rgba(0,0,0,0.73);
    }

    .change-pic-button{
        background-color: transparent;
        border: none;
        float: right;
        padding: 3px;
    }

    .change-pic-button:focus{
        outline: none;
    }

    #max-input{
        border-radius: 15px;
        padding: 5px;
        margin: 10px;
        border-style: solid;
        float: right;
        width: 80px;
    }
    #max-input:focus{
        outline: none;
    }

    .copyright{
        margin: 15px;
        float: right;
        color: aliceblue;
    }

    .color-picker{
        margin: 5px;
        display: inline-block;
        float: right;
    }

</style>
