let input = " JavaScript ";
let output = "<div>" + input.trim() + "</div>";

console.log(output);

const person = {
  name: "Ralph",
  age: "27",
  address: {
    country: "Liberia",
    city: "Monrovia",
  },
};
const result = { ...person };
console.log(result);
