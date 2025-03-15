class MealModel {
    String ? id;
    String ? title;
    String ? category;
    String ? imgUrl;
    int ? prepTime;
    String ? summary;
    List<String> ? ingredients;
    List<String> ? directions;
    Map<String, dynamic> ? nutrients;

    MealModel({
        this.id,
        this.title,
        this.category,
        this.imgUrl,
        this.prepTime,
        this.summary,
        this.ingredients,
        this.directions,
        this.nutrients,
    });
}