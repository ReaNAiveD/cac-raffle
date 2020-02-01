<template>
    <div class="app-block">
        <div class="cell-grid" :style="gridStyle">
            <div :class="['outer-cell']" v-for="(info, index) in cellInfo" :key="index">
                <RandomCell :style="[{}, cellStyle]" :num-style="numStyle" :degree-speed="180 + 540 * Math.random()" :target-num="info.targetNum" :max-num="info.maxNum" :state="state"/>
            </div>
            <button :class="['round-button']" :style="gridLineButton" autofocus @click="startStop">{{buttonDis}}</button>
        </div>
    </div>
</template>

<script>
    import RandomCell from "@/components/RandomCell";

    export default {
        name: "Raffle",
        components: {
            RandomCell
        },
        props : {
            maxNum : {
                type : Number,
                default : 888
            },
            numStyle : {
                type: Object,
                default: function () {
                    return {
                        fontSize: '80px'
                    }
                }
            },
            cellColor : {
                type: String,
                default: 'rgba(185,120,204,0.4)'
            }
        },
        data: function() {
            return {
                buttonDis : "START",
                state : 0,
                cellInfo : [],
                cellCount : 3
            }
        },
        computed: {
            gridStyle: function() {
                return {
                    display: 'grid',
                    gridTemplateColumns: 'repeat(' + this.cellCount + ', 1fr)',
                    gridTemplateRows: 'calc(100% - 70px) 70px'
                }
            },
            gridLineButton : function() {
                return {
                    gridColumnStart: '1',
                    gridColumnEnd: this.cellCount + 1
                }
            },
            cellStyle : function() {
                return {
                    width: '100%',
                    height: '100%',
                    margin: '0 auto',
                    borderStyle: 'double',
                    border: '5px',
                    borderColor: 'black',
                    backgroundColor: this.cellColor,
                }
            }
        },
        watch: {
            // eslint-disable-next-line no-unused-vars
            maxNum(newVal, val) {
                this.cellCount = Math.floor(Math.log10(Math.max(newVal, 1))) + 1;
                this.cellInfo = [];
                for (let i = 0; i < this.cellCount; i++){
                    if (i === 0){
                        this.cellInfo.push({targetNum : 0, maxNum : Math.floor(newVal / Math.pow(10, this.cellCount - 1))});
                    }
                    else {
                        this.cellInfo.push({targetNum : 0, maxNum : 9});
                    }
                }
            }
        },
        created() {
            this.cellCount = Math.floor(Math.log10(Math.max(this.maxNum, 1))) + 1;
            for (let i = 0; i < this.cellCount; i++){
                if (i === 0){
                    this.cellInfo.push({targetNum : 0, maxNum : Math.floor(this.maxNum / Math.pow(10, this.cellCount - 1))});
                }
                else {
                    this.cellInfo.push({targetNum : 0, maxNum : 9});
                }
            }
            window.console.log(this.cellInfo);
        },
        methods: {
            startStop: function () {
                if (this.state === 0) {
                    this.state = 1;
                    this.buttonDis = "STOP";
                }
                else {
                    this.state = 0;
                    this.buttonDis = "START";
                    let targetNum = Math.floor((this.maxNum + 1) * Math.random());
                    window.console.log(targetNum);
                    for (let i = this.cellCount - 1; i >= 0; i--){
                        this.cellInfo[i].targetNum = targetNum % 10;
                        targetNum = Math.floor(targetNum / 10);
                    }
                }
            }
        }
    }
</script>

<style scoped>
.app-block{
    width: 100%;
    height: 100%;
}

.cell-grid{
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-rows: calc(100% - 70px);
    height: 100%;
}

@media screen and (min-width:480px){
    .outer-cell {
        margin: 5px 5px;
    }
}/* 超小设备（手机，小于 768px） */

@media screen and (min-width:1200px) {
    .outer-cell {
        margin: 5px 35px;
    }
} /* 小型设备（平板电脑，768px 起） */

.round-button{
    border-radius: 40px;
    width: 300px;
    font-size: 40px;
    padding: 5px;
    margin: 5px auto;
    border: 5px double rgba(25, 156, 255, 1);
    background-color: rgba(104, 177, 255, 0.9);
    color: aliceblue;
}
.round-button:focus{
    outline: none;
}
</style>