describe("Product navigation", () => {
  
  beforeEach(() => {
    cy.viewport(1920, 1080)
    cy.visit("http://localhost:3000/")
  })


  it("Should navigate from the home page to the product detail page by clicking on a product", () => {
    cy.get('.products')
    cy.get('[data-testid="product-article"]')
      .first()
      .click()
    cy.get('.products-show').should('be.visible')
  })
})