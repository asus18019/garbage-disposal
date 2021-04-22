export const garbageType = {
    glass: 1,
    paper: 2,
    organic: 3,
    unsorted: -1,
}

export const setGarbageTitle = (garbageID) => {
    switch (garbageID) {
        case garbageType.paper:
            return "Бумага";
        case garbageType.glass:
            return "Стекло";
        case garbageType.organic:
            return "Органические";
        default:
            return ;
    }
}