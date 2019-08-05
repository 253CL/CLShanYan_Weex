<template>
  <div class="wrapper">
    <div class="panel" @click="handleClick">
      <text class="text">立即体验</text>
    </div>
    <div>
      <text >{{content}}</text>
    </div>
  </div>
</template>

<style scoped>
  .wrapper {
    align-items: center;
    justify-content: center;
  }
  .panel {
    margin-top: 40px;

    /*border-width: 2px;*/
    /*border-style: solid;*/
    /*border-color: #BBB;*/
    background-color: #0088fb;
    border-radius: 10px;
    padding-top: 15px;
    padding-bottom: 15px;
    padding-left: 15px;
    padding-right: 15px;
    margin-bottom: 30px;
  }
  .text {
    lines:3;
    color: white;
    font-size: 32px;
    align-content: center;
    align-items: center;
  }
</style>
<script>
const modal = weex.requireModule('modal')
const toast = message => {
  modal.toast({
    message,
    duration: 1
  })
}
// export default {
//   methods: {
//     handleClick: function (e) {
//       weex.requireModule('ShanYanManager').initShanYanSDK(5, function complete (result) {
//         toast(JSON.stringify(result))
//       })
//     }
//   }
// }

module.exports = {
  data: {},
  methods: {
    handleClick: function (e) {
      weex.requireModule('ShanYanManager').quickAuthLoginWithConfigureComplete(function complete (result) {
        toast(JSON.stringify(result))
      })
    }
  },
  init: function () {
    console.log('在初始化内部变量，并且添加了事件功能后被触发')
  },
  created: function () {
    console.log('完成数据绑定之后，模板编译之前被触发')
    weex.requireModule('ShanYanManager').preGetPhonenumber()
  },
  ready: function () {
    console.log('模板已经编译并且生成了 Virtual DOM 之后被触发')
  },
  destroyed: function () {
    console.log('在页面被销毁时调用')
  }
}
</script>
