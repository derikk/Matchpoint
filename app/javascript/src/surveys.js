window.addQuestion = function() {
  // Use current time for question key
  let time = new Date().getTime();

  let fieldset = document.createElement("fieldset");
  fieldset.classList.add("mb-3")
  fieldset.innerHTML = 
  `<div class="form-floating">
  <textarea placeholder="Question goes here." name="survey[questions_attributes][${time}][question]" ></textarea>
  <label for="survey_questions_attributes_${time}_question">Question</label>
  </div>
  <label for="survey_questions_attributes_${time}_A">A</label>
  <input name="survey[questions_attributes][${time}][A]" class="form-control">
  <label for="survey_questions_attributes_${time}_B">B</label>
  <input name="survey[questions_attributes][${time}][B]" class="form-control">
  <label for="survey_questions_attributes_${time}_C">C</label>
  <input name="survey[questions_attributes][${time}][C]" class="form-control">
  <label for="survey_questions_attributes_${time}_D">D</label>
  <input name="survey[questions_attributes][${time}][D]" class="form-control">
  <label for="survey_questions_attributes_${time}_E">E</label>
  <input name="survey[questions_attributes][${time}][E]" class="form-control">`;

  document.getElementById("questions").appendChild(fieldset);
}
