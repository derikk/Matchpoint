window.addQuestion = function() {
  // Use current time for question key
  let time = new Date().getTime();
  const answer = (letter) => (
  `<div class="input-group mb-2">
    <span class="input-group-text">${letter}</span>
    <input type="text" name="survey[questions_attributes][${time}][${letter}]">
  </div>`);

  let fieldset = document.createElement("fieldset");
  fieldset.classList.add("mb-3")
  fieldset.innerHTML = 
  `<div class="form-floating">
    <textarea rows="3" placeholder="Question goes here." name="survey[questions_attributes][${time}][question]"></textarea>
    <label class="qnum" for="survey_questions_attributes_${time}_question">Question</label>
  </div>
  ${answer("A")}
  ${answer("B")}
  ${answer("C")}
  ${answer("D")}
  ${answer("E")}`;

  document.getElementById("questions").appendChild(fieldset);
}
