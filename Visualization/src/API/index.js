export const getImages = () => {
return fetch("./images").then((res) => {
    return res.json();
});
} 

export const getPeopleStats = () => {
    return ;
}