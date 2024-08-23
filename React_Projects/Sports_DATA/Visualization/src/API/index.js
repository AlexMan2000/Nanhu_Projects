export const getPeopleStats = () => {
return fetch("./Experiment_Data.json").then((res) => {
    return res.json();
});
} 