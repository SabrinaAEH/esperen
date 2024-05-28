// Gestion des changements de quantité
document.querySelectorAll('.form-control').forEach(input => {
  input.addEventListener('change', function() {
    const itemId = this.dataset.itemId;
    const quantity = this.value;

    fetch(`/cart_items/${itemId}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({ quantity: quantity })
    })
    .then(response => response.json())
    .then(data => {
      // Mettre à jour le montant total sur la page avec la nouvelle valeur
      document.querySelector('#total-amount').textContent = data.total_amount;
    })
    .catch(error => console.error('Error:', error));
  });
});

// Gestion de la suppression d'un article
document.addEventListener('DOMContentLoaded', function() {
  const deleteButtons = document.querySelectorAll('.delete-item');

  deleteButtons.forEach(button => {
    button.addEventListener('click', function() {
      const itemId = this.dataset.itemId;
      
      fetch(`/cart_items/${itemId}`, {
        method: 'DELETE'
      })
      .then(response => {
        if (response.ok) {
          // Actualiser la page pour refléter les changements
          window.location.reload();
        } else {
          console.error('La suppression de l\'élément du panier a échoué.');
        }
      })
      .catch(error => {
        console.error('Erreur lors de la suppression de l\'élément du panier : ', error);
      });
    });
  });
});
