/// <reference types="cypress" />




describe('jungle-rails app add to cart function', () => {
  beforeEach(() => {

    cy.visit('http://localhost:3000')
  })

  it("adds product to the cart", () => {
    cy.get('.btn').first().click({force: true})
    cy.get('#my-cart').should('contain', 'My Cart (1)')
    cy.get('a[href*="/cart"]').should('contain', 'My Cart (1)')
    cy.contains('My Cart (1)').should('be.visible')
  });

})
