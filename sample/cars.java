package sample;

public class cars {

    private int price;
    private int kilometers;
    private String engine;
    private int Model_id;


    public cars(int price, int kilometers, String engine,int model_id) {
        this.price = price;
        this.kilometers = kilometers;
        this.engine = engine;
        this.Model_id = model_id;
    }




    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getKilometers() {
        return kilometers;
    }

    public void setKilometers(int kilometers) {
        this.kilometers = kilometers;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public int getModel_id() {
        return Model_id;
    }

    public void setModel_id(int model_id) {
        Model_id = model_id;
    }
}
