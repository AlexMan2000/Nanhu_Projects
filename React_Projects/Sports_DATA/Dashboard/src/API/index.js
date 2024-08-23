export const getOrders = () => {
  return fetch("https://dummyjson.com/carts/1").then((res) => res.json());
};

export const getRevenue = () => {
  return fetch("https://dummyjson.com/carts").then((res) => res.json());
};

export const getInventory = () => {
  return fetch("https://dummyjson.com/products").then((res) => res.json());
};  

export const getCustomers = () => {
  return fetch("https://dummyjson.com/users").then((res) => res.json());
};

export const getPeopleStats = () => {
  return fetch("./项目总评.json").then((res) => res.json());
} 

export const getComments = () => {
  return fetch("https://dummyjson.com/comments").then((res) => res.json());
};

// 单脚站立
export const getSingleFootData = () => {
  return fetch("./单脚站立.json").then(res=>res.json());
}

// 俯卧撑
export const getPushUpData = () => {
  return fetch("./俯卧撑.json").then(res=>res.json());
}

// 仰卧起坐
export const getSitUpData = () => {
  return fetch("./仰卧起坐.json").then(res=>res.json());
}

// 原地起跳
export const getJumpInplaceData = () => {
  return fetch("./原地起跳.json").then(res=>res.json());
}

// 原地快跑
export const getFastRunData = () => {
  return fetch("./原地快跑.json").then(res=>res.json());
}

// 立位体前屈
export const getFrontData = () => {
  return fetch("./立位体前屈.json").then(res=>res.json());
}

// export const getAllData = () => {
//   return [getSingleFootData(),getJumpInplaceData(),getFastRunData(),getFrontData(),getAllData()];
// }