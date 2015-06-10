public abstract class AppBase
{
  protected PApplet parent;

  public AppBase(PApplet parentApplet) {
    this.parent = parentApplet;
  }

  public void init() {
  };

  public void display() {
  };
}
