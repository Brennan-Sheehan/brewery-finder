<template>
  <div>
    <div class="manager-profile">
      <header class="header-container">
        <div class="title">
          <h1 class="welcome">Welcome Paris</h1>
          <h4 class="tagline">What would you like to do?</h4>
        </div>
      </header>
      <main class="main-container">
        <div class="table-container">
          <table id="tblUsers" class="data-table">
            <thead>
              <h3>Users</h3>
              <tr>
                <th>username</th>
                <th>user Id</th>
                <th>role</th>
                <th>actions</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="user in GET_USERS"
                v-bind:key="user.userId"
                v-bind:user="user"
              >
                <td>{{ user.username }}</td>
                <td>{{ user.id }}</td>
                <td
                  v-for="authority in user.authorities"
                  v-bind:key="authority.name"
                >
                  {{ authority.name }}
                </td>
                <!-- <div class="button=container" v-for="authority in user.authorities" v-bind:key="authority.name">
                            <button class="toggle-role" value="Reload Page" v-on:click="setBrewer(user.id), toggleRole(user.id)">{{ authority.name === 'ROLE_ADMIN' ? 'Make User' : 'Make Brewer'}}</button>
                            </div> -->
                <td class="button-container">
                  <button
                    class="make-brewer"
                    value="Reload Page"
                    v-on:click="setBrewerToUser(user.id)"
                  >
                    Make Brewer
                  </button>
                  <button
                    class="make-user"
                    value="Reload Page"
                    v-on:click.prevent="setUserToBrewer(user.id)"
                  >
                    Make User
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="table-container">
          <h3>Breweries</h3>
          <form>
            <label>Brewery Id</label>
            <input type="text" v-model="breweryId" />
            <label>Brewer Id</label>
            <input type="text" v-model="brewerId" />
            <button
              class="update-brewer"
              v-on:click.prevent="changeBrewerOnBrewery()"
            >
              Update Brewer
            </button>
          </form>
          <table id="tblBreweries" class="data-table">
            <thead>
              <tr>
                <th>brewery Name</th>
                <th>brewery Id</th>
                <th>brewer Id</th>
                <th>address</th>
                <th class="actions">actions</th>
              </tr>
            </thead>
            <tbody
              v-for="brewery in GET_BREWERIES"
              v-bind:key="brewery.breweryId"
              v-bind:brewery="brewery"
            >
              <tr>
                <td>{{ brewery.breweryName }}</td>
                <td class="id">{{ brewery.breweryId }}</td>
                <td class="id">{{ brewery.brewerId }}</td>
                <td>{{ brewery.address }}</td>
                <td>
                  <button
                    class="delete-brewery"
                    v-on:click="this.deleteBrewery(brewery.breweryId)"
                  >
                    Delete Brewery
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";

export default {
  name: "manager-profile",
  data() {
    return {
      users: this.GET_USERS,
      breweries: this.GET_BREWERIES,
      user: {},
      isEditing: false,
      brewerId: "",
      breweryId: "",
    };
  },
  methods: {
    ...mapActions("managerModule", [
      "getUserList",
      "setBrewer",
      "setUser",
      "deleteBrewery",
      "changeBrewer",
    ]),
    ...mapActions("breweryModule", ["getBreweries"]),
    setBrewerToUser(id) {
      this.singleUser = this.GET_USERS.find((user) => (user.id = id));
      this.setBrewer({ user: this.singleUser, role: "ROLE_ADMIN" });
      window.location.reload();
    },
    setUserToBrewer(id) {
      this.singleUser = this.GET_USERS.find((user) => (user.id = id));
      this.setUser({ user: this.singleUser, role: "ROLE_USER" });
      window.location.reload();
    },
    // toggleRole(id) {
    //   const userToUpdate = this.GET_USERS.find((user) => user.id === id);
    //   if (userToUpdate) {
    //     const newRole =
    //       userToUpdate.role === "ROLE_ADMIN" ? "ROLE_USER" : "ROLE_ADMIN";
    //     this.toggleRole({ user: userToUpdate, role: newRole });
    //     ManagerService.updateRole({ user: userToUpdate, role: newRole })
    //       .then((response) => {
    //         if (response.status === 200) {
    //           this.$store.commit("SET_ROLE", userToUpdate);
    //         }
    //       })
    //       .catch((error) => {
    //         if (error.response && error.response.status === 404) {
    //           alert("Unable to change role");
    //         }
    //       });
    //   }
    // },

    changeBrewerOnBrewery() {
      const updatedBrewery = this.GET_BREWERIES.find(
        (d) => d.breweryId == this.breweryId
      );
      updatedBrewery.brewerId = this.brewerId;
      this.changeBrewer(updatedBrewery);
    },
  },
  computed: {
    ...mapGetters("breweryModule", ["GET_BREWERIES"]),
    ...mapGetters("managerModule", ["GET_USERS", "GET_SINGLE_USER"]),
  },
  mounted() {
    this.getUserList();
    this.getBreweries();
  },
};
</script>

<style scoped>
.manager-profile {
  display: flex;
  flex-direction: column;
  background-color: #f1f1f1;
  color: rgba(17, 21, 20, 255);
}

.header-container {
  background-color: rgba(53, 54, 49, 255);
  color: #f1f1f1;
  width: 100%;
}

.main-container {
  display: flex;
  flex-direction: column;
  width: 100%;
  max-width: 1200px;
  align-self: center;
}

.table-container {
  max-width: 100%;
  margin: 10px;
}

th,
td {
  border: 1px solid #ccc;
  text-align: left;
  color: rgba(53, 54, 49, 255);
}

th {
  color: rgba(17, 21, 20, 255);
  text-transform: uppercase;
  border: 1px;
}

.title {
  margin-top: 10rem;
  margin-left: 5rem;
}

.make-brewer {
  color: rgba(17, 21, 20, 255);
  border: 2px solid #35363152;
  background-color: rgba(241, 79, 41, 255);
  width: 100%;
  max-width: 120px;
  margin: 2px;
  border-radius: 3px;
}

.make-user {
  color: rgba(17, 21, 20, 255);
  border: 2px solid #35363152;
  width: 100%;
  max-width: 120px;
  margin: 2px;
  border-radius: 3px;
}

.update-brewer {
  color: rgba(17, 21, 20, 255);
  border: 2px solid #353631;
  background-color: rgba(241, 79, 41, 255);
  border-radius: 5px;
  margin-left: 20px;
}

.delete-user {
  color: rgba(17, 21, 20, 255);
  border: 2px solid #353631;
}

@media (min-width: 768px) {
  th,
  td {
    padding: 10px 10px 3px 10px;
  }

  form {
    display: flex;
    align-items: center;
  }
  form input {
    margin: 0.5rem;
  }
  .button-container {
    width: 125px;
  }
}
</style>
