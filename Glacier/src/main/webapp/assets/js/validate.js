/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//DOI TUONG VALIDATOR
function Validator(options) {

  function getParent(element, selector) {
    while (element.parentElement) {
      if (element.parentElement.matches(selector)) {
        return element.parentElement;
      }
      element = element.parentElement;
    }
  }

  let selectorRules = {};
  //FUNCTION DE VALIDATE INPUT ELEMENT
  const validate = (inputElement, rule) => {
    let errorMessage;
    let errorElement = getParent(inputElement, options.formGroupSelector).querySelector(options.errorElement);

    //RULES CUA FIELD MA ONBLUR
    //LAY RA CAC RULES CUA SELECTOR
    let rules = selectorRules[rule.selector];
    //console.log(rules);
    //LAP QUA TUNG RULE VA KIEM TRA
    for (let i = 0; i < rules.length; i++) {
      //console.log(inputElement.type);
      switch (inputElement.type) {
        case 'radio':
          errorMessage = rules[i](
            formElement.querySelector(rule.selector + ':checked')
          );
          break;
        // case 'checkbox':
        //   errorMessage = rules[i](
        //     formElement.querySelector(rule.selector + ':checked')
        //   );
        //   break;
        default:
          errorMessage = rules[i](inputElement.value);
          break;
      }
      //NEU CO LOI THI DUNG KIEM TRA
      if (errorMessage) break;
    }
    if (errorMessage) {
      errorElement.innerText = errorMessage;
      getParent(inputElement, options.formGroupSelector).classList.add('invalid');
    } else {
      errorElement.innerText = '';
      getParent(inputElement, options.formGroupSelector).classList.remove('invalid');
      
    }
    return !errorMessage;
  };

  //LAY ELEMENT CUA FORM CAN VALIDATE
  let formElement = document.querySelector(options.form);
  if (formElement) {
    //KHI SUBMIT FORM
    formElement.onsubmit = (e) => {

      e.preventDefault();
      let isFormValid = true;

      options.rules.forEach((rule) => {
        let inputElement = formElement.querySelector(rule.selector);
        console.log(inputElement);
        let isValid = validate(inputElement, rule);
        if (!isValid)
          isFormValid = false;
      });

      if (isFormValid) {
        //console.log(isFormValid);
        //TRUONG HOP SUBMIT VOI JS onSubmit
        if (typeof options.onSubmit === 'function') {
          let enableInputs = formElement.querySelectorAll('[name]:not([disabled])');
          let formValues = Array.from(enableInputs).reduce((values, input) => {
            switch (input.type) {
              case 'radio':
                if(input.matches(':checked')){
                  values[input.name] = input.value;
                  break;
                }else{
                  values[input.name] = '';
                }
                break;

              default:
                values[input.name] = input.value;
               
                break;
            }
            return values;
          }, {});

          //console.log(formValues);
          options.onSubmit(formValues);
        }
        //TRUONG HOP SUBMIT VOI HANH VI MAC DINH
        else {
          formElement.submit();
        }
      }
      // else{
      //   e.preventDefault();
      // }
    };
    //LAP QUA MOI RULE VA XU LY (eventListenerL: blur, input)
    options.rules.forEach((rule) => {
      //LUU LAI CAC RULE CHO MOI INPUT

      if (Array.isArray(selectorRules[rule.selector])) {
        selectorRules[rule.selector].push(rule.test);
      } else {
        selectorRules[rule.selector] = [rule.test];
      }

      let inputElements = formElement.querySelectorAll(rule.selector);
      
      Array.from(inputElements).forEach((inputElement) => {
        if (inputElement) {
          //Xu ly truong hop blur khoi input
          inputElement.onblur = () => {
            validate(inputElement, rule);
          };
          //Xu ly moi khi nguoi dung nhap vao input 
          inputElement.oninput = () => {
            let errorElement = getParent(inputElement, options.formGroupSelector).querySelector(options.errorElement);
            errorElement.innerText = '';
            getParent(inputElement, options.formGroupSelector).classList.remove('invalid');
          };
        }
      });
    });

    console.log(selectorRules);
  }
}

Validator.isRequired = function (selector) {
  return {
    selector: selector,
    test: function (value) {
      //console.log(typeof value);
      return value ? undefined : 'Vui lòng nhập trường này';
    }
  };
};

Validator.isEmail = function (selector) {
  return {
    selector: selector,
    test: function (value) {
      let regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
      return regex.test(value) ? undefined : 'Vui lòng nhập email';
    }
  };

};
Validator.isPhoneNumber = (selector) => {
  return {
    selector: selector,
    test: function (value) {
      let regex = /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/;
      return regex.test(value) ? undefined : 'Vui lòng nhập số đt';
    }
  };
};
Validator.minLength = (selector, minLength) => {
  return {
    selector: selector,
    test: (value) => {
      return value.length >= minLength ? undefined : `Vui lòng nhập tối thiểu ${minLength} kí tự`;
    }
  };
};

Validator.isConfirmed = (selector, getConfirmValue, message) => {
  return {
    selector: selector,
    test: (value) => {
      return value === getConfirmValue() ? undefined : message || 'Giá trị nhập vào không chính xác';
    }
  };
};
Validator.excludeNumber = (selector) => {
  return {
    selector: selector,
    test: function (value) {
      let regex = /\d/;
      let regex2 = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?`]/;
      return !regex.test(value) && !regex2.test(value) ? undefined : 'Ten khong chua ki tu dac biet hoac so';
    }
  };
};






