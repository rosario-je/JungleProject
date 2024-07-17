describe("Adding to cart", () => {
  
  beforeEach(() => {
    cy.viewport(1920, 1080)
    cy.visit("http://localhost:3000/")
  })


  it("Should navigate to the home page, click on add to cart on a product, and see 1 item in the cart", () => {
    cy.get('.nav-item.end-0') 
      .should('contain', 'My Cart (0)') 
    cy.get('.products')
    cy.get('[data-testid="product-article"]')
      .first()
      .contains('Add')
      .click() 
    cy.get('.nav-item.end-0')
      .should('contain', 'My Cart (1)')
})

})