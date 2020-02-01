<template>
    <div class="bg-cell">
        <div class="back-disp" :style="[{transform: 'rotateX(' + degree + 'deg)', fontSize : '80px'}, numStyle]">
            {{showNum}}
        </div>
    </div>
</template>

<script>
    export default {
        name: "RandomCell",
        props: {
            targetNum : {
                type : Number,
                default : 0
            },
            state : {
                // 有两个值，0为停止状态，1为旋转状态
                type : Number,
                default: 0
            },
            degreeSpeed : {
                type : Number,
                default : 360
            },
            maxNum : {
                type : Number,
                default : 9
            },
            fontSize : {
                type : Number,
                default : 80
            },
            numStyle : {
                type : Object
            }
        },
        data: function () {
            return {
                // trueState有如下状态
                // 0 默认停止状态
                // 1 旋转状态，用户未停止
                // 2 旋转状态，用户停止
                trueState: 0,
                degree: 0,
                stopDegree: 0,
                showNum: 0,
                rate: 20
            }
        },
        created: function() {
            setInterval(this.framesUpdate, this.rate);
        },
        methods: {
            framesUpdate: function () {
                // window.console.log(this.trueState);
                let rangedDegree = this.degree % 180;
                let inc = this.degreeSpeed * this.rate / 1000;
                switch (this.trueState){
                    case 0:
                        if (this.state === 1){
                            this.trueState = 1;
                        }
                        break;
                    case 1:
                        // window.console.log("inc");
                        if (this.state === 0){
                            this.trueState = 2;
                            this.stopDegree = Math.floor((this.degree + 180) / 360) * 360 + 360;
                            break;
                        }
                        this.degree += inc;
                        if ((rangedDegree - 90) < 0 && (rangedDegree - 90 + inc) >= 0){
                            this.showNum = Math.floor(Math.random() * (this.maxNum + 1));
                            this.degree += 180;
                        }
                        break;
                    case 2:
                        if (this.state === 1){
                            this.trueState = 1;
                        }
                        this.degree += inc;
                        if ((rangedDegree - 90) < 0 && (rangedDegree - 90 + inc) >= 0){
                            this.showNum = this.targetNum;
                            this.degree += 180;
                        }
                        if (this.degree >= this.stopDegree){
                            this.degree = 0;
                            this.trueState = 0;
                        }
                        break;
                }
            }
        }
    }
</script>

<style scoped>
    .bg-cell{
        position: relative;
    }
    .back-disp{
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        position: absolute;
    }
</style>