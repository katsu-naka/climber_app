import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html =`
    <div class="message-box mb-3">
    <p>${data.content.created_at}</p>
    <p>${data.content.message}</p>
    </div>
    `;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message-text');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
