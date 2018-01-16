let functions = require('firebase-functions')
let admin = require('firebase-admin')
admin.initializeApp(functions.config().firebase)

exports.announceProduct = functions.database
  .ref('products/{productId}')
  .onCreate(event => {
    let product = event.data.val()
    sendNotification(product)
  })

function sendNotification(product) {
  let title = product.title
  let cost = product.cost

  let payload = {
    notification: {
      title: 'New Product Available',
      body: title + ' for $' + cost,
      sound: 'default',
      mutable_content: 'true'
    }
  }

  console.log(payload)

  let topic = "newProducts"
  admin.messaging().sendToTopic(topic, payload)
}