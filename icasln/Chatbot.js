var messages = [];

function addQuestionMessageBoxDiv() {
    const div = document.querySelector(".messages");

    const questionDiv = document.createElement("div");
    questionDiv.classList.add("question", "questionCount" + messages.length);

    div.appendChild(questionDiv);

    messages.push({ type: 'question', div: questionDiv });
}

function addResponseMessageBoxDiv() {
    const div = document.querySelector(".messages");

    const responseDiv = document.createElement("div");
    responseDiv.classList.add("response", "responseCount" + messages.length);

    div.appendChild(responseDiv);

    messages.push({ type: 'response', div: responseDiv });
}

function updateUserMessageDiv(userInput) {
    const { div } = messages[messages.length - 1];

    const newMessageDiv = document.createElement("div");
    newMessageDiv.textContent = username + ": " + userInput;

    div.appendChild(newMessageDiv);
}

function updateChatbotMessageDiv(response) {
    const { div } = messages[messages.length - 1];

    const newMessageDiv = document.createElement("div");
    newMessageDiv.textContent = chatbotname + ": " + response;

    div.appendChild(newMessageDiv);
}

function applyClass(elementUniqueId, className) {
    var element = document.getElementById(elementUniqueId);
    if (element) {
        element.classList.add(className);
    }
}