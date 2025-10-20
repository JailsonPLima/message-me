import consumer from "channels/consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const formatDate = () => {
      const date = new Date(data.message.created_at);

      const year = date.getFullYear();
      const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are 0-indexed
      const day = String(date.getDate()).padStart(2, '0');
      const hours = String(date.getHours()).padStart(2, '0');
      const minutes = String(date.getMinutes()).padStart(2, '0');

      return `${day}/${month}/${year} ${hours}:${minutes}`;
    }

    const message = `
      <li class="messages__item">
        <div class="message">
          <div class="message__wrapper">
            <span class="message__author">
              ${data.user}
            </span>
            <span class="message__content">
              ${data.message.body}
            </span>
          </div>
          <small class="message__timestamp">
            ${formatDate()}
          </small>
        </div>
      </li>
    `

    document.querySelector(".messages__list").innerHTML += message
    document.querySelector(".chatroom__textarea").value = ''
  }
});
